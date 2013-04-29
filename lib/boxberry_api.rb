# encoding: utf-8
require 'nokogiri'

require 'boxberry_api/version'
require 'boxberry_api/ext'
require 'boxberry_api/base'
require 'boxberry_api/xml'

module BoxberryApi

  extend self

  # Статусы доставки Boxberry.ru
  STATUES = {

    10  => "Заказ передагн клиенту",
    18  => "Заказ прибыл в пункт выдачи",
    19  => "Заказ вернулся",
    22  => "Заказ принят на склад Boxberry"

  }.freeze

  def ip(v = nil)

    @ip = v.ip_to_int unless v.blank?
    @ip

  end # ip

  def auth_for?(target_ip)

    target_ip = target_ip.ip_to_int if target_ip.is_a?(String)
    target_ip == self.ip

  end # auth_for?

end # BoxberryApi

if defined?(::Rails)
  require 'boxberry_api/engine'
  require 'boxberry_api/railtie'
end