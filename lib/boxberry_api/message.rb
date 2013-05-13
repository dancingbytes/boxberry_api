# encoding: utf-8
module BoxberryApi

  class Message

    def initialize(order)
      @order = order
    end  # new

    def method_missing(name, *args, &block)
      ::BoxberryApi.error "[BoxberryApi::Message] SMS шаблон не найден. Код статуса доставки: #{@order.delivery_state_code}."
    end # method_missing

    def send_sms
      send("msg_#{@order.delivery_state_code}".to_sym)
    end # send_sms

    def msg_10

      send_message "Спасибо, что воспользовались нашими услугами! Пожелания или жалобы просим отправлять на dir@anlas.ru. Будем рады отзыву на Яндекс.Маркете!"
      true

    end # msg_10

    def msg_18

      send_message "Заказ № #{@order.uri} прибыл в пункт выдачи Боксберри."
      true

    end # msg_18

    def msg_19

      send_message "Оформленный вами заказ № #{@order.uri} от #{@order.created_at('%d.%m.%Y %H:%M')} вернулся обратно."
      true

    end # msg_19

    def msg_22

      send_message "Заказ № #{@order.uri} передан на доставку в Боксберри. По факту прибытия заказа вы получите смс-уведомдение."
      true

    end # msg_22

    private

    def send_message(msg)

      unless ::SMS.convert_phone(@order.phone_number)

        ::BoxberryApi.error "[BoxberryApi::Message] Неверный формат телефона: #{@order.phone_number}."
        return false

      else

        ::BoxberryApi.error msg
        ::SMS.message(@order.phone_number, msg)
        return true

      end # unless

    end # send_message

  end # Message

end # BoxberryApi
