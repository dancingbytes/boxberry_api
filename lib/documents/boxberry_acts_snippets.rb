# encoding: utf-8
module Boxberry

  module Acts

    DEFAULTS = {

      principal_name:     ->() { "ООО «Анлас»" },
      principal_on_face:  ->() { "Балакирева Дмитрия Алексеевича" },
      principal_based_on: ->() { "Устава" },

      agent_name:         ->() { "ООО «Смарт-бук»" },
      agent_on_face:      ->() { "Директора Астафьева К. В." },
      agent_based_on:     ->() { "Устава" },

      doc_num:            ->() { self.get_number("ARD") },
      doc_date:           ->() { ::Time.now },
      contract_num:       ->() { "ПВ.12.М-227" },
      contract_date:      ->() { ::Time.new(2013, 3, 20) }

    }.freeze

    class << self

      def get_number(mark = "")

        counter = ::Mongoid.default_session['admin'].
          find(:name => "Boxberry#{mark}_0").
          modify({ "$inc" => { count: 1 } }, { upsert: true, new: true })["count"]

        "#{counter.to_s}"

      end # get_number

    end # class << self

    class Snippets

      extend ::ActionView::Helpers::NumberHelper

      def self.method_missing(name, *args, &block)
        "not found"
      end # method_missing

      def initialize(data)
        @data = data
      end # new

      def doc_num
        @data.doc_num
      end # doc_num

      def doc_day
        @data.doc_day
      end # doc_day

      def doc_month
        @data.doc_month
      end # doc_month

      def doc_year
        @data.doc_year
      end # doc_year

      def items_count
        @data.items.length
      end # items_count

      def items

        str = ""
        i   = 0

        @data.items.each do |item|

          i += 1

          str << "<tr>"
            str << "<td class=\"num\">#{i}</td>"
            str << "<td class=\"order\">#{item['order_num']}</td>"
            str << "<td class=\"weight\">#{item['weight']}</td>"
            str << "<td class=\"price\">#{item['delivery_price']}</td>"
            str << "<td class=\"total\">#{item['total_price']}</td>"
          str << "<tr>"

        end # each

        str

      end # items

      def declared_value

        coop = ( (@data.declared_value.to_f - @data.declared_value.to_i).round(2)*100 ).to_i
        coop = 0 if coop == 100

        str = @data.declared_value.to_count(["рубль", "рубля", "рублей", "ноль рублей"]) do |num, s|
          (num.to_human + " " + s).first_capitalize
        end

        str << coop.to_count(["копейка", "копейки", "копеек", " 00 копеек"]) do |num, s|
          " " + String(num).rjust(2, '00') + " " + s
        end

        "#{@data.declared_value.round(2)} руб. #{str}"

      end # declared_value

      def principal_name
        @data.principal_name
      end # principal_name

      def principal_based_on
        @data.principal_based_on
      end # principal_based_on

      def principal_on_face
        @data.principal_on_face
      end # principal_on_face

      def principal_position
        @data.principal_position
      end # principal_position

      def principal_fio
        @data.principal_fio
      end # principal_fio

      def agent_name
        @data.agent_name
      end # agent_name

      def agent_based_on
        @data.agent_based_on
      end # agent_based_on

      def agent_on_face
        @data.agent_on_face
      end # agent_on_face

      def agent_position
        @data.agent_position
      end # agent_position

      def agent_fio
        @data.agent_fio
      end # agent_fio

      def contract_num
        @data.contract_num
      end # contract_num

      def contract_day
        @data.contract_day
      end # contract_day

      def contract_month
        @data.contract_month
      end # contract_month

      def contract_year
        @data.contract_year
      end # contract_year

      private

      def method_missing(name, *args, &block)
        "not found"
      end # method_missing

    end # Snippets

  end # Acts

end # Boxberry
