# encoding: utf-8
namespace :boxberry do

  desc "Загрузка списка городов доставки в базу сайта"
  task :install => :environment do

    puts
    puts "Clear boxberry deliveries... "
    ::Delivery.where(:delivery_type_id  => ::BoxberryApi::UUID).with(safe: true).delete_all
    puts "Ok"

    ext_deliveries = [

      # EMS
      {
        delivery_type_id: "4f86e26e8a67ad5f0f000006",
        price:  "расчитывается",
        time:   "5 - 14 дней",
        description: "Почта EMS является дорогим, но относительно быстрым способом доставки. Средняя стоимость варьируется от 800 до 2000 рублей. Вы можете рассчитать приблизительную стоимость доставки, воспользовавшись калькулятором на сайте <a href=\"http://www.emspost.ru/ru/calc/\">Почты EMS</a>. Выберите Челябинскую область в качестве пункта отправления и вес заказа.",
        position: 10
      }, {
        # Почта России
        delivery_type_id: "4f86e26e8a67ad5f0f00000b",
        price:  "от 200 руб.",
        time:   "1 – 3 недели",
        description: "Мы хорошо упакуем ваш заказ, вложим накладную, все необходимые инструкции и отправим Почтой России. Если необходимо, вы можете выбрать &laquo;Наложенный платёж&raquo; &mdash; в данном случае оплата будет производиться на месте, в вашем местном почтовом отделении. Минус данного способа оплаты &mdash; дополнительная комиссия, которую взимает Почта России в размере нескольких процентов. Из плюсов &mdash; широкая география отделений по всей стране.",
        position: 11
      }, {
        # Почта России 1 класс
        delivery_type_id: "5100ed648a67adc7f1000026",
        price:  "от 250 руб.",
        time:   "1 – 3 недели",
        description: "<span style=\"font-weight: bold;\">Максимальный вес посылки 2 кг.</span><br />Мы хорошо упакуем ваш заказ, вложим накладную, все необходимые инструкции и отправим Почтой России. Если необходимо, вы можете выбрать &laquo;Наложенный платёж&raquo; &mdash; в данном случае оплата будет производиться на месте, в вашем местном почтовом отделении. Минус данного способа оплаты &mdash; дополнительная комиссия, которую взимает Почта России в размере нескольких процентов. Из плюсов &mdash; широкая география отделений по всей стране.",
        position: 12
      }

    ]

    puts "Insert boxberry deliveries... "
    ::BoxberryApi::Delivery.codes.each do |key, values|

      descr = ""
      descr << "<span style=\"font-weight: bold;\">Адрес:</span> #{values[:address]}<br />" unless values[:address].blank?
      descr << "<span style=\"font-weight: bold;\">Телефон:</span> #{values[:phone]}<br />" unless values[:phone].blank?
      descr << "<span style=\"font-weight: bold;\">График работы:</span> #{values[:work]}"  unless values[:work].blank?

      b  = ::BoxberryApi::Delivery.delivery_cost_for_zone(values[:zone])

      r, d, a, v = key.split('-')

      dv = ::Delivery.new

      dv.region_code      = r
      dv.district_code    = d
      dv.area_code        = a
      dv.village_code     = v
      dv.location         = "test"

      dv.delivery_type_id = ::BoxberryApi::UUID
      dv.price            = "от #{b.ceil} руб."
      dv.time             = values[:delivery].to_count("день", "дня", "дней", "дней")
      dv.description      = descr
      dv.position         = 2

      unless dv.with(safe: true).save
        puts "key: #{key}, r: #{r}, d: #{d}, a: #{a}, v: #{v}."
        puts dv.errors.inspect
        throw "ERROR"
      end

      count = Delivery.
        where({
          region_code:    r,
          district_code:  d,
          area_code:      a,
          village_code:   v,
          :delivery_type_id.in => [
            "4f86e26e8a67ad5f0f00000b",
            "5100ed648a67adc7f1000026",
            "4f86e26e8a67ad5f0f000006"
          ]
        }).count

      if count == 0

        ext_deliveries.each do |hash|

          dv = ::Delivery.new

          dv.region_code      = r
          dv.district_code    = d
          dv.area_code        = a
          dv.village_code     = v
          dv.location         = "test"

          dv.delivery_type_id = hash[:delivery_type_id]
          dv.price            = hash[:price]
          dv.time             = hash[:time]
          dv.description      = hash[:description]
          dv.position         = hash[:position]

          unless dv.with(safe: true).save
            puts "key: #{key}, r: #{r}, d: #{d}, a: #{a}, v: #{v}."
            puts dv.errors.inspect
            throw "ERROR"
          end

        end # each

      end # if

    end # each

    Rake::Task["anlas:order_deliveries"].invoke

    puts "Ok"

  end # :install

end # :boxberry

# bundle exec rake boxberry:install --trace
