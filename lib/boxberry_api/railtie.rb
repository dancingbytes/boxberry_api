# encoding: utf-8
require 'rails/railtie'

module BoxberryApi

  class Railtie < ::Rails::Railtie #:nodoc:

    rake_tasks do
      load File.expand_path('../../tasks/boxberry.rake', __FILE__)
    end

  end # Railtie

end # BoxberryApi
