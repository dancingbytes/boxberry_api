# encoding: utf-8
namespace :boxberry do

  desc "Загрузка списка городов доставки в базу сайта"
  task :install => :environment do

    puts
    puts "Clear boxberry deliveries... "
    ::Delivery.where(:delivery_type_id  => ::BoxberryApi::UUID).with(safe: true).delete_all
    puts "Ok"


    puts "Insert boxberry deliveries... "
    ::BoxberryApi::Delivery.codes.each do |key, values|

      descr = ""
      descr << "<span style=\"font-weight: bold;\">Адрес:</span> #{values[:address]}<br />" unless values[:address].blank?
      descr << "<span style=\"font-weight: bold;\">Телефон:</span> #{values[:phone]}<br />" unless values[:phone].blank?
      descr << "<span style=\"font-weight: bold;\">График работы:</span> #{values[:work]}"  unless values[:work].blank?

      b, e  = ::BoxberryApi::Delivery.delivery_cost_for_zone(values[:zone])

      r, d, a, v = key.split('-')

      dv = ::Delivery.new

      dv.region_code      = r
      dv.district_code    = d
      dv.area_code        = a
      dv.village_code     = v
      dv.location         = "test"

      dv.delivery_type_id = ::BoxberryApi::UUID
      dv.price            = "от #{b} руб. до #{e} руб."
      dv.time             = values[:delivery].to_count("день", "дня", "дней", "дней")
      dv.description      = descr

      unless dv.with(safe: true).save
        puts "key: #{key}, r: #{r}, d: #{d}, a: #{a}, v: #{v}."
        puts dv.errors.inspect
        throw "ERROR"
      end

    end # each

    puts "Ok"

  end # :install

end # :boxberry

# bundle exec rake boxberry:install --trace
