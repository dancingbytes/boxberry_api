# encoding: utf-8
module BoxberryApi

  module StringExt

    def ip_to_int

      return unless self =~ /^((([01]?\d{1,2})|(2([0-4]\d|5[0-5])))\.){3}(([01]?\d{1,2})|(2([0-4]\d|5[0-5])))$/
      bits = self.split(/\./)
      bits[0].to_i*256*256*256 + bits[1].to_i*256*256 + bits[2].to_i*256 + bits[3].to_i

    end # ip_to_int

  end # StringExt

end # BoxberryApi

class String
  include ::BoxberryApi::StringExt
end # String
