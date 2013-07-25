# encoding: utf-8
module BoxberryApi

  module Base

    extend self

    # Список заказов покупателей, которые еще не выгружались.
    # Если параметр data не задан, то вы выводятся все заказы.
    def list_orders(sc = nil, all = nil)

      selector = ::Order.by_boxberry.for_delivery
      selector = selector.where(:delivery_state_code.in => [0, nil]) if all != true

      ::BoxberryApi::XML.
        new(selector, sc).
        list_orders().
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

          d, m, y = date.split(".")

          begin

            new_date = Time.new(y.to_i + 2000, m.to_i, d.to_i, 0, 0, 0).utc #rescue Time.now.utc
            update_history(state, order, new_date)

          rescue  => e

            ::Rails.logger.tagged("BoxBerry [new_date]") {
              ::Rails.logger.error("date: #{date} -> #{state}")
              ::Rails.logger.error(e.message)
              ::Rails.logger.error(e.backtrace.join("\n"))
            }

          end

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
      ::BoxberryMailer.errors(data).deliver

    end # orders_errors

    private

    def update_history(state, order, new_date)

      case state.try(:to_i)

        # Вручение
        when 10 then

          ::ParcelTrack.update_status(order.delivery_identifier, {
            message:      "Заказ передан клиенту",
            timestamp:    new_date,
            service_name: "Boxberry",
            operation:    6
          })

        # Готов к вручению
        when 18 then

          datas = ::BoxberryApi::Delivery.info_for_city(order)

          str = "Заказ № #{order.uri} прибыл в пункт выдачи Боксберри."
          str << " К оплате: #{order.price.indent} руб." unless order.payed?
          str << " Адрес: #{datas[:address]}."      if datas[:address]
          str << " Телефон: #{datas[:phone]}."      if datas[:phone]
          str << " Время работы: #{datas[:work]}."  if datas[:work]

          res = ::ParcelTrack.update_status(order.delivery_identifier, {
            message:      str,
            timestamp:    new_date,
            service_name: "Boxberry",
            operation:    5
          })

          # TODO: Временное решение
          ::SmsQuery.send_sms(order.phone_number, str, order.uri) unless res

        # Возврат
        when 19 then

          ::ParcelTrack.update_status(order.delivery_identifier, {
            message:      ::BoxberryApi.status(19),
            timestamp:    new_date,
            service_name: "Boxberry",
            operation:    7
          })

        # Приём
        when 22 then

          ::ParcelTrack.update_status(order.delivery_identifier, {
            message:      ::BoxberryApi.status(22),
            timestamp:    new_date,
            service_name: "Boxberry",
            operation:    2
          })

        else
          ::BoxberryApi.error "[BoxberryApi::Base.update_history] Шаблон не найден. Код статуса доставки: #{state}."

      end # case

    end # update_history

  end # Base

end # BoxberryApi
