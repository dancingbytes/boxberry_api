# encoding: utf-8
class BoxberryController < ApplicationController

  unloadable

  before_filter :auth

  # POST /api/boxberry
  def actions

    case params[:act].try(:downcase)

      # Список необработанных заказов (не выгружались в БД Boxberry)
      when "get_notcomplete" then return_answer_for(
        ::BoxberryApi::Base.list_orders
      )

      # Изменение статусов заказов
      when "complete_orders" then return_answer_for(
        ::BoxberryApi::Base.change_statuses(params[:data])
      )

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
      not_found
    end

  end # return_answer_for()

  def not_found

    respond_to do |format|
      format.html { render :file => "#{::Rails.root}/public/404.html", :status => 404, :layout => false }
      format.any  { head 404 }
    end

  end # not_found

  def auth

    unless ::BoxberryApi.auth_for?(request.remote_ip)

      respond_to do |format|
        format.html { render :file => "#{::Rails.root}/public/422.html", :status => 422, :layout => false }
        format.any  { head 422 }
      end

    end # unless

  end # auth

end # BoxberryController
