# encoding: utf-8
module BoxberryApi

  module Base

    extend self

    # Список заказов покупателей, которые еще не выгружались.
    # Если параметр data не задан, то вы выводятся все заказы.
    def list_orders(all = nil)

      selector = ::Order.by_boxberry.for_delivery
      selector = selector.where(:delivery_state_code.in => [0, nil]) if all != true

      ::BoxberryApi::XML.
        new(selector).
        list_orders.
        to_file

    end # list_orders

    # Изменить статусы заказов
    # На входе строка вида: 294373;29.05.2010;18|279347;29.05.2010;18|
    def change_statuses(data, delimiter1 = "|", delimiter2 = ";")

      # Список обработанных заказов
      orders = []

      # Разбиваем основную строку
      (String(data).split(delimiter1) || []).each do |str|

        # Разбиваем внутреннюю строку
        (order_uri, date, state) = (String(str).split(delimiter2) || [])

        if (order = ::Order.by_boxberry.where(:uri => order_uri).first)

          # Вносим id заказа в список обработанных
          orders << order.id

          # Изменяем статус доставки у заказа
          order.delivery_state_code = state
          order.delivery_state_name = ::BoxberryApi.status(state)

          Order.with(safe: true).where(:_id => order.id).update_all({
            delivery_state_code: order.delivery_state_code,
            delivery_state_name: order.delivery_state_name
          })

          # Сохраняем изменения в истории заказа
          ::OrderHistory.create({

            :type_code  => 5,
            :order_id   => order.id,
            :order_uri  => order.uri,
            :order_created_at => order.created_at,
            :email      => order.email,
            :created_at => (date.to_time rescue nil),
            :content    => "#{::OrderHistory::HISTORY_TYPES[5]}: #{::BoxberryApi::status(state)}"

          })

          # Отправлем смс-сообщение пользователю
          ::BoxberryApi.send_message(order)

        end # if

      end # arr

      # Если заказов нет -- завершаем работу
      return if orders.empty?

      # Выбираем обработанные заказы и строим xml-ответ
      ::BoxberryApi::XML.
        new( ::Order.by_boxberry.where(:_id.in => orders) ).
        status_orders.
        to_file

    end # change_statuses

    # Ответ Boxberry об ошибках заказа.
    def orders_errors(data)

      return if data.blank?

      data.force_encoding("utf-8")
      ::BoxberryMailer.errors(data).deliver

    end # orders_errors

  end # Base

end # BoxberryApi
