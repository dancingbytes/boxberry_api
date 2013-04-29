# encoding: utf-8
class BoxberryController < ApplicationController

  unloadable

  before_filter :auth

  # POST /api/boxberry
  def actions

    case params[:act].try(:downcase)

      when "get_notcomplete"
        return_answer_for("")

      when "complete_orders"
        return_answer_for("")

      else
        not_found

    end # case

  end # actions

  private

  def return_answer_for(file)

    if file && ::File.exists?(file)

      send_file(file,
        :type => '',
        :disposition => 'attachment'
      )

    else
      not_found
    end

  end # return_answer_for()

  def not_found

    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false }
      format.any  { head 404 }
    end

  end # not_found

  def auth

    unless BoxberryApi.auth_for?(request.remote_ip)

      respond_to do |format|
        format.html { render :file => "#{Rails.root}/public/422.html", :status => 422, :layout => false }
        format.any  { head 422 }
      end

    end # if

  end # auth

end # BoxberryController
