# encoding: utf-8
module Boxberry

  class Document

    def initialize
      throw "Requires the implementation"
    end # new

    def save

      begin

        file = self.to_file
        return false unless file

        multimedia.file_upload = file
        multimedia.save

      rescue => e

        ::BoxberryApi.log(e.message, self.class.to_s)
        false

      end

    end # save

    def to_file

      file = ::File.join(::File.dirname(__FILE__), "templates", "#{@file_name}.html")

      unless ::File.exists?(file)

        ::BoxberryApi.log("File #{file} not found", self.class.to_s)
        return

      end # unless

      content = ::File.read(file)
      marks   = content.scan(/\{([[:alpha:]][A-Za-z0-9\_]+)\}/i)

      marks.flatten.uniq.each do |mark|

        content.gsub!(
          /{#{mark}}/,
          (@snippets.send(mark.to_sym) || "").to_s
        )

      end unless marks.nil?

      ::BoxberryApi.to_pdf(content)

    end # to_file

    def ext
      multimedia.ext
    end # ext

    def url
      multimedia.url
    end # url

    def size
      multimedia.size
    end # size

    private

    # Файловый менеджер
    def multimedia
      @multimedia ||= ::Multimedia.new
    end # multimedia

  end # Document

end # Boxberry
