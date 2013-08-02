# encoding: utf-8
#
# Наклейка на коробку
#
module Boxberry

  class Sticker < ::Boxberry::Document

    def initialize(datas)

      # Переменные
      @snippets = ::Boxberry::Sticker::Snippets.new(datas)

      # Название документа
      @doc_name = "sticker"

    end # new

    #
    # Переменные для наклейки на коробку
    #
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
        ::BoxberryApi.barcode(@order.uri)
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

  end # Sticker

end # Boxberry
