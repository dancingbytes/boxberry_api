# encoding: utf-8
module BoxberryApi

  module Base

    extend self

    # Список заказов покупателей, которые еще не выгружались.
    # Если параметр data не задан, то вы выводятся все заказы.
    def list_orders(all = nil)

      selector = ::Order.by_boxberry
      selector = selector.for_delivery.where(:delivery_state_code => 0) unless !!all

      ::BoxberryApi::XML.
        new(selector).
        list_orders.
        to_file

    end # list_orders

    # Изменить статусы заказов
    def change_statuses(data)

      # Изменен статус доставки
      # OrderHistory.create_notice(self, 5, self.delivery_state_name('Неизвестно') ) if @delivery_state_code_changed

      # @delivery_state_code_changed  = self.delivery_state_code_changed?

      # При смене статуса доставки нужно производить нужные действия
      # do_action if @delivery_state_code_changed

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