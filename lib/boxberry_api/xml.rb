# encoding: utf-8
module BoxberryApi

  class XML

    PHONE_RE  = /\A(\+7|7|8)(\d{10})\Z/

    def initialize(selector)

      @selector = selector
      @source   = nil

    end # new

    def list_orders

      current_date = ::Time.now

      create_xml do |xml|

        xml.orders({ "date" => current_date.strftime("%d.%m.%Y %H:%M") }) {

          xml.OrdersDay({ "day" => current_date.strftime("%Y%m%d") }) {

            if @selector.count == 0
              xml.text(" ")
            else

              @selector.each do |order|
                create_order_card(xml, order)
              end # selector

            end

          } # OrdersDay

        } # orders

      end # create_xml

    end # list_orders

    def status_orders

      create_xml do |xml|

        xml.set_status {

          if @selector.count == 0
            xml.text(" ")
          else

            @selector.each do |order|
              xml.order("id" => order.uri, "status" => order.delivery_state_code)
            end # selector

          end

        } # set_status

      end # create_xml

    end # status_orders

    def to_file(file_path = nil)

      return unless valid?

      file_path ||= "/tmp/boxberry-#{::Time.now.to_f}-#{rand}.xml"

      ::File.open(file_path, "wb") do |f|
        f.write(self.to_s)
      end

      File.new(file_path)

    end # to_file

    def to_s
      @source.to_xml
    end # to_s

    private

    def valid?
      !@source.nil?
    end # valid?

    def create_xml(&block)

      @source = Nokogiri::XML::Builder.new(:encoding => 'UTF-8', &block)
      self

    end # create_xml

    def create_order_card(xml, order)

      delivery = ::BoxberryApi::Delivery.new(order, order.weight)

      xml.order({ "id" => order.uri }) {

        # Общая стоимость заказа (ключая доставку)
        xml.price         order.price

        # Сумма которую необходимо брать с конечного получателя
        xml.payment_sum   (order.payed? ? 0 : order.price)

        # Стоимость доставки
        xml.delivery_sum  order.delivery_cost

        # Планируемая дата передачи заказа покупателя в Boxberry
        xml.send_date     order.send_date.try(:strftime, "%d.%m.%Y %H:%M")

        # Штрих-код заказа
        xml.barcode       order.uri

        # Номер накладной по которой пришел заказ от интернет-магазина в Boxberry
        xml.torg12        order.uri

        # Вид доставки
        xml.vid           1

        # Данные интернет-магазина
        xml.supplier {

          xml.name        "ООО «Анлас»"

          xml.inn         "7450073925"

          xml.kpp         "745001001"

        } # supplier

        # Данные Boxberry
        xml.shop({ "id" => 725 }) {

          # Код пункта самовывоза заказа (покупатель)
          xml.name        delivery.delivery_point

          # Код пункта приема заказа (интенет-магазин)
          xml.name1       delivery.collection_point

        } # shop

        # Данные покупателя
        xml.customer {

          xml.fio         order.fio
          xml.phone       convert_phone(order.phone_number)

          if order.legal_entity

            xml.name      order.organization
            xml.address   order.juridical_address
            xml.inn       order.inn
            xml.kpp       order.kpp
            xml.r_s       order.account
            xml.bank      order.bank_name
            xml.kor_s     order.korr_account
            xml.bik       order.bik

          else

            xml.name      ""
            xml.address   ""
            xml.inn       ""
            xml.kpp       ""
            xml.r_s       ""
            xml.bank      ""
            xml.kor_s     ""
            xml.bik       ""

          end

        } # customer

        # Товары
        xml.items {

          order.cart_items.each do |item|
            create_item_card(xml, item)
          end

        } # items

        # Вес (в граммах)
        xml.weights {
          xml.weight      (order.weight * 1000).to_i
        } # weights

      } # order

    end # create_order_card

    def create_item_card(xml, item)

      xml.item({ "id" => item.marking_of_goods }) {

        # Название товара
        xml.name      xml_escape(item.name)

        # Единица измерения
        xml.UnitName  (item.unit.blank? ? "шт." : item.unit)

        # НДС
        xml.nds       "18%"

        # Стоимость ( с учетом количества товара)
        xml.price     item.price

        # Количество товаров
        xml.quantity  item.count

      } # item

    end # create_item_card

    def convert_phone(phone)

      r = phone.to_s.gsub(/\D/, "").scan(::BoxberryApi::XML::PHONE_RE)
      r.empty? ? nil : r.last.last

    end # convert_phone

    def xml_escape(str)

      str
        .gsub(/&/, "&amp;")
        .gsub(/'/, "&apos;")
        .gsub(/"/, "&quot;")
        .gsub(/>/, "&gt;")
        .gsub(/</, "&lt;")

    end # xml_escape

  end # XML

end # BoxberryApi
