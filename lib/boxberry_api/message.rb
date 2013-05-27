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

      datas = ::BoxberryApi::Delivery.info_for_city(@order)

      str = "Заказ № #{@order.uri} прибыл в пункт выдачи Боксберри."
      str << " К оплате: #{@order.price.indent} руб." unless @order.payed?
      str << " Адрес: #{datas[:address]}."      if datas[:address]
      str << " Телефон: #{datas[:phone]}."      if datas[:phone]
      str << " Время работы: #{datas[:work]}."  if datas[:work]

      send_message str
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

        begin
          ::SMS.message(@order.phone_number, msg)
        rescue => e
          ::Rails.logger.tagged("SMS [message]") {
            ::Rails.logger.error(e.message)
          }
        end

        return true

      end # unless

    end # send_message

  end # Message

end # BoxberryApi
