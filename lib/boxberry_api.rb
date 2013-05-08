# encoding: utf-8
require 'nokogiri'

require 'boxberry_api/version'
require 'boxberry_api/ext'
require 'boxberry_api/message'
require 'boxberry_api/mailer'

module BoxberryApi

  extend self

  # Статусы доставки Boxberry.ru
  STATUSES = {

    10  => "Заказ передан клиенту",
    18  => "Заказ прибыл в пункт выдачи",
    19  => "Заказ вернулся",
    22  => "Заказ принят на склад Boxberry"

  }.freeze

  def accept(v = nil)

    @accept = v.ip_to_int unless v.blank?
    @accept

  end # accept

  def auth_for?(target_ip)

    target_ip = target_ip.ip_to_int if target_ip.is_a?(String)
    @accept && target_ip == @accept

  end # auth_for?

  # Расходы
  def charges(v = nil)

    @charges = v.to_i.abs unless v.blank?
    @charges || 0

  end # charges

  def disposition(v = nil)

    @disposition = v unless v.blank?
    @disposition || "inline"

  end # disposition

  def content_type(v = nil)

    @content_type = v unless v.blank?
    @content_type || "text/xml"

  end # content_type

  def status(code)
    ::BoxberryApi::STATUSES[code] || 'Неизвестный статус'
  end # status

  def status?(code)
    !::BoxberryApi::STATUSES[code].nil?
  end # status?

  def send_message(order)

    msg = ::BoxberryApi::Message.new(order)
    msg.send_sms

  end # send_message

  def errors(msg)

    ::Rails.logger.tagged("\nBoxberryApi") {
      ::Rails.logger.error(msg)
    }

  end # errors

  alias :error :errors

end # BoxberryApi

require 'boxberry_api/delivery'
require 'boxberry_api/base'
require 'boxberry_api/xml'

require 'boxberry_api/engine'
require 'boxberry_api/railtie'
