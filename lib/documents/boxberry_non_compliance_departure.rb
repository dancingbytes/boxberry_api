# encoding: utf-8
#
# Акт несоответствия отправления
#
module Boxberry

  class NonComplianceDeparture < ::Boxberry::Document

    def initialize(datas)

      # Переменные
      @snippets = ::Boxberry::NonComplianceDeparture::Snippets.new(datas)

      # Название файла документа
      @file_name = "non_compliance_departure"

    end # new

    class Model < ::Boxberry::Model

      def document
        @document ||= ::Boxberry::NonComplianceDeparture.new(self)
      end # document

    end # Model

    class Snippets < ::Boxberry::Acts::Snippets

      def items

        str = ""
        i   = 0

        @data.items.each do |item|

          i += 1

          str << "<tr>"
            str << "<td class=\"num\">#{i}</td>"
            str << "<td class=\"order\">#{item['order_num']}</td>"
            str << "<td class=\"weight\">#{item['weight']}</td>"
            str << "<td class=\"price\">#{item['total_price']}</td>"
            str << "<td class=\"total\">#{item['reason']}</td>"
          str << "<tr>"

        end # each

        str

      end # items

    end # Snippets

  end # NonComplianceDeparture

end # Boxberry
