# encoding: utf-8
module BoxberryDocument

  class Snippets

    extend ::ActionView::Helpers::NumberHelper

    def self.method_missing(name, *args, &block)
      "not found"
    end # method_missing

    def initialize(order)
      @order = order
    end # new

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

    def save

      file = ::File.join(File.dirname(__FILE__), "templates", "boxberry.html")

      return false unless ::File.exists?(file)

      content = ::File.read(file)
      marks   = content.scan(/\{([[:alpha:]][A-Za-z0-9\_]+)\}/i)

      marks.flatten.uniq.each do |mark|
        content.gsub!(/{#{mark}}/, @snippets.send(mark.to_sym))
      end unless marks.nil?

      begin

        pdf = ::PDFKit.new(content)

        @multimedia.file_upload = pdf.to_file("/tmp/#{::Time.now.to_f}-#{rand}.pdf")
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
