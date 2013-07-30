# encoding: utf-8
require 'nokogiri'

require 'boxberry_api/version'
require 'boxberry_api/ext'
require 'boxberry_api/mailer'
require 'boxberry_api/cities'

module BoxberryApi

  extend self

  # Уникальный идентификатор доставки
  UUID = "517a60368a67adab23000004".freeze

  # Статусы доставки Boxberry.ru
  STATUSES = {

    10  => "Заказ передан клиенту",
    18  => "Заказ прибыл в пункт выдачи",
    19  => "Заказ вернулся",
    22  => "Заказ принят на склад Boxberry"

  }.freeze

  def accept(*args)

    @accept = args.map(&:ip_to_int) if args.length != 0
    @accept

  end # accept

  def auth_for?(target_ip)

    target_ip = target_ip.ip_to_int if target_ip.is_a?(String)
    ::BoxberryApi.accept.include?(target_ip)

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
    ::BoxberryApi::STATUSES[code.try(:to_i) || -1] || 'Неизвестный статус'
  end # status

  def status?(code)
    !::BoxberryApi::STATUSES[code.try(:to_i) || -1].nil?
  end # status?

  def errors(msg)

    ::Rails.logger.error(msg)
    msg

  end # errors

  alias :error :errors

end # BoxberryApi

require 'boxberry_api/delivery'
require 'boxberry_api/base'
require 'boxberry_api/xml'

require 'documents/boxberry_document'
require 'documents/boxberry_acceptance_report_document'

require 'boxberry_api/engine'
require 'boxberry_api/railtie'
