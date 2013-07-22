# encoding: utf-8
module BoxberryDocument

  class Snippets

    extend ::ActionView::Helpers::NumberHelper

    def self.method_missing(name, *args, &block)
      "not found"
    end # method_missing

    def initialize(order)

      @order    = order
      @boxberry = ::BoxberryApi::Delivery.new(order)

    end # new

    def barcode
      ::Barcode.new(@order.uri, { width: 200, height: 48 }).ean13.base64
    end # barcode

    def order_number
      @order.uri
    end # order_number

    def delivery_type
      "САМОВЫВОЗ"
    end # delivery_type

    def order_adress
      @order.city_name
    end # order_adress

    def order_fio
      @order.fio
    end # order_fio

    def unpacking_type
      "СО ВСКРЫТИЕМ"
    end # unpacking_type

    def order_cost_str

      # Если заказ оплачен -- возвращаем ноль
      return "0" if @order.payed?

      # Иначе -- пишем сумму к оплате
      str = "#{@order.price.round(2).indent} ("

      coop = ( (@order.price.to_f - @order.price.to_i).round(2)*100 ).to_i
      coop = 0 if coop == 100

      str << @order.price.to_count(["рубль", "рубля", "рублей", "ноль рублей"]) do |num, s|
        (num.to_human + " " + s).first_capitalize
      end

      str << coop.to_count(["копейка", "копейки", "копеек", " 00 копеек"]) do |num, s|
        " " << String(num).rjust(2, '00') << " " << s
      end

      str << ")"

    end # order_cost_str

    def sorting_center

      case @boxberry.sc

        when '010'  then "ЦСУ Москва"
        when '1002' then "ЦСУ Екатеринбург"

        else "нет данных"

      end

    end # sorting_center

    def places
      "1/1"
    end # places

    def weight
      "#{@order.weight.round(2)} кг."
    end # weight

    private

    def method_missing(name, *args, &block)
      "not found"
    end # method_missing

  end # Snippets

  class Document

    def initialize(datas)

      # Переменные
      @snippets   = ::BoxberryDocument::Snippets.new(datas)

      # Файловый менеджер
      @multimedia = ::Multimedia.new

    end # new

    def to_file

      file = ::File.join(::File.dirname(__FILE__), "templates", "boxberry.html")

      return unless ::File.exists?(file)

      content = ::File.read(file)
      marks   = content.scan(/\{([[:alpha:]][A-Za-z0-9\_]+)\}/i)

      marks.flatten.uniq.each do |mark|
        content.gsub!(/{#{mark}}/, @snippets.send(mark.to_sym))
      end unless marks.nil?

      pdf = ::PDFKit.new(content)
      pdf.to_file("/tmp/#{::Time.now.to_f}-#{rand}.pdf")

    end # to_file

    def save

      begin

        file = self.to_file
        return false unless file

        @multimedia.file_upload = file
        @multimedia.save

      rescue => e

        ::Rails.logger.tagged("BoxberryDocument") {
          ::Rails.logger.error(e.message)
        }
        false

      end

    end # save

    def ext
      @multimedia.ext
    end # ext

    def url
      @multimedia.url
    end # url

    def size
      @multimedia.size
    end # size

  end # Document

end # BoxberryDocument
