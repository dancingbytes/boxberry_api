# encoding: utf-8
class BoxberryController < ApplicationController

  unloadable

  before_filter :auth

  # POST /api/boxberry
  def actions

    file_path = File.join(Rails.root, "tmp", "#{rand}-#{Time.now.to_f}.boxberry.txt")
    File.open(file_path, 'wb') do |f|
      f.write request.body.read
    end

    puts "File: #{file_path}"
    puts "Params: #{params}"
    puts

    case params[:act].try(:downcase)

      # Список необработанных заказов (не выгружались в БД Boxberry)
      when "get_notcomplete" then return_answer_for(
        ::BoxberryApi::Base.list_orders
      )

      # Изменение статусов заказов
      when "complete_orders" then return_answer_for(
        ::BoxberryApi::Base.change_statuses(params[:data])
      )

      # Ошибки заказов
      when "orders_errors" then

        ::BoxberryApi::Base.orders_errors(params[:data])

        respond_to do |format|
          format.html { render :text => "Ok", :status => 200, :layout => false }
          format.any  { head 200 }
        end

      # Список всех заказов
      else return_answer_for(
        ::BoxberryApi::Base.list_orders(true)
      )

    end # case

  end # actions

  private

  def return_answer_for(file)

    if file && ::File.exists?(file)

      send_file(file,
        :type         => ::BoxberryApi.content_type,
        :disposition  => ::BoxberryApi.disposition
      )

    else
      bad_request
    end

  end # return_answer_for()

  def bad_request

    respond_to do |format|
      format.html { render :text => "Неверный запрос", :status => 400, :layout => false }
      format.any  { head 400 }
    end

  end # bad_request

  def not_found

    respond_to do |format|
      format.html { render :text => "Ресурс не найден", :status => 404, :layout => false }
      format.any  { head 404 }
    end

  end # not_found

  def auth

    unless ::BoxberryApi.auth_for?(request.remote_ip)

      respond_to do |format|
        format.html { render :text => "Доступ запрещен", :status => 403, :layout => false }
        format.any  { head 403 }
      end

    end # unless

  end # auth

end # BoxberryController
