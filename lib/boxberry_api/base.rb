# encoding: utf-8
module BoxberryApi

  class Base

    # Список заказов покупателей, которые еще не выгружались.
    # Если параметр data не задан, то вы выводятся все заказы.
    def list_orders(not_copleted_only = true)

    end # list_orders

    # Изменить статусы заказов
    def change_statuses(data)


=begin
      OrderHistory.create_notice(self,
        5,
        BoxberryApi::STATUSES[code] || "Неизвестный статус"),
        nil,
        self.delivery_state_date
      )

=end

    end # change_statuses

  end # Base

end # BoxberryApi