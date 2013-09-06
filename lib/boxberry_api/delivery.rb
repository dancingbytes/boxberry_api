# encoding: utf-8
module BoxberryApi

  class Delivery

    OPENNING_ORDER = 19

    class << self

      def cost(order)
        new(order).cost
      end # cost

      def tarif_table

        return @tarif_table if @tarif_table

        h = ::Hash.new{ |k,v| k[v] = {} }

        # Зона: 0
        h[0] = {

          0.5   => 49,
          1.0   => 51,
          1.5   => 53,
          2.0   => 55,
          2.5   => 57,
          3.0   => 59,
          3.5   => 61,
          4.0   => 63,
          4.5   => 65,
          5.0   => 67,
          6.0   => 70,
          7.0   => 73,
          8.0   => 76,
          9.0   => 79,
          10.0  => 82,
          11.0  => 85,
          12.0  => 88,
          13.0  => 91,
          14.0  => 94,
          15.0  => 97

        }

        # Зона: 1
        h[1] = {

          0.5   => 89,
          1.0   => 121,
          1.5   => 153,
          2.0   => 185,
          2.5   => 217,
          3.0   => 249,
          3.5   => 281,
          4.0   => 313,
          4.5   => 345,
          5.0   => 377,
          6.0   => 432,
          7.0   => 487,
          8.0   => 542,
          9.0   => 597,
          10.0  => 652,
          11.0  => 707,
          12.0  => 762,
          13.0  => 817,
          14.0  => 872,
          15.0  => 927

        }

        # Зона: 2
        h[2] = {

          0.5   => 99,
          1.0   => 134,
          1.5   => 169,
          2.0   => 204,
          2.5   => 239,
          3.0   => 274,
          3.5   => 309,
          4.0   => 344,
          4.5   => 379,
          5.0   => 414,
          6.0   => 474,
          7.0   => 534,
          8.0   => 594,
          9.0   => 654,
          10.0  => 714,
          11.0  => 774,
          12.0  => 834,
          13.0  => 894,
          14.0  => 954,
          15.0  => 1014

        }

        # Зона: 3
        h[3] = {

          0.5   => 109,
          1.0   => 147,
          1.5   => 185,
          2.0   => 223,
          2.5   => 261,
          3.0   => 299,
          3.5   => 337,
          4.0   => 375,
          4.5   => 413,
          5.0   => 451,
          6.0   => 516,
          7.0   => 581,
          8.0   => 646,
          9.0   => 711,
          10.0  => 776,
          11.0  => 841,
          12.0  => 906,
          13.0  => 971,
          14.0  => 1036,
          15.0  => 1101

        }

        # Зона: 4
        h[4] = {

          0.5   => 119,
          1.0   => 160,
          1.5   => 201,
          2.0   => 242,
          2.5   => 283,
          3.0   => 324,
          3.5   => 365,
          4.0   => 406,
          4.5   => 447,
          5.0   => 488,
          6.0   => 558,
          7.0   => 628,
          8.0   => 698,
          9.0   => 768,
          10.0  => 838,
          11.0  => 908,
          12.0  => 978,
          13.0  => 1048,
          14.0  => 1118,
          15.0  => 1188

        }

        @tarif_table = h
        @tarif_table

      end # tarif_table

      def delivery_cost_for_zone(zone)

        tt = self.tarif_table[zone]

        return if tt.nil?
        return (tt[0.5] + ::BoxberryApi::Delivery::OPENNING_ORDER) * 1.03

      end # delivery_cost_for_zone

      def codes
        ::BoxberryApi::Cities::CODES
      end # codes

      def info_for_city(city)

        self.codes[

          [
            city.region_code,
            city.district_code,
            city.area_code,
            city.village_code
          ].join("-")

        ] || {}

      end # info_for_city

    end # class << seff

    def initialize(order)

      @order    = order
      @table    = self.class.codes[ city_format(order) ] || {}
      @tariff   = calculate_tariff(order.weight)

    end # initialize

    # Стоимость вскрытия заказа
    def additional_cost
      ::BoxberryApi::Delivery::OPENNING_ORDER
    end # additional_cost

    def cost

      return 0      unless self.valid?
      return @cost  unless @cost.nil?

      @cost = 0

      unless @order.payed?
        @cost += (@order.basket_price * 0.05)
      end

      @cost += ((@tariff + self.additional_cost) * 1.04)
      @cost += (@order.package_price * 1.2)

      @cost

    end # cost

    def cost_base

      return 0            unless self.valid?
      return @cost_base   unless @cost_base.nil?

      @cost_base = @tariff
      @cost_base

    end # cost_base

    def reward

      return 0        unless self.valid?
      return @reward  unless @reward.nil?

      @reward = 0

      unless @order.payed?

        @reward += (@order.basket_price * 0.025)
        @reward += (@tariff * 1.025)

      else
        @reward += @tariff
      end

      @reward += self.additional_cost
      @reward

    end # reward

    def valid?
      !@tariff.nil?
    end # valid?

    def zone
      @table[:zone]
    end # zone

    # Сортировочный пункт / пункт выдачи заказов
    def code
      @table[:code]
    end # code

    alias :delivery_point :code

    # Сортировочный центр
    def sc
      @table[:sc]
    end # sc

    # Код пункта приема
    def collection_point
      20
    end # collection_point

    private

    def city_format(city)

      [
        city.region_code,
        city.district_code,
        city.area_code,
        city.village_code
      ].join('-')

    end # city_format

    def calculate_tariff(weight)

      return nil if weight.nil? || weight <= 0 || weight > 15 || self.zone.nil?

      table = self.class.tarif_table[self.zone]
      return nil unless table

      h1    = table.select { |k, v| k >= weight }.first(2)

      l, r  = h1[0], h1[1]

      (weight <= l[0] ? l[1] : r[1])

    end # calculate_tariff

  end # Delivery

end # BoxberryApi
