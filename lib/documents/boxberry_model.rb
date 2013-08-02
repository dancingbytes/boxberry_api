# encoding: utf-8
#
# Класс по обработке данных, полученых из UI
#
module Boxberry

  class Model

    include ::ActiveModel::Validations
    include ::ActiveModel::Conversion
    extend  ::ActiveModel::Naming

    attr_accessor :doc_num,
                  :doc_date,
                  :contract_num,
                  :contract_date,
                  :items,

                  :principal_name,
                  :principal_based_on,
                  :principal_on_face,
                  :principal_position,
                  :principal_fio,

                  :agent_name,
                  :agent_based_on,
                  :agent_on_face,
                  :agent_position,
                  :agent_fio

    validates_presence_of :contract_num,
                          :contract_date,

                          :principal_name,
                          :principal_based_on,
                          :principal_on_face,

                          :agent_name,
                          :agent_based_on,
                          :agent_on_face

    def initialize(attributes = nil)

      (attributes || {}).each do |name, value|

        method = "#{name}=".to_sym
        send(method, prepare_val(value) ) if self.respond_to?(method)

      end # each

      set_defaults_if_empty

    end # new

    def document
      throw "Requires the implementation"
    end # document

    def save

      return false unless self.valid?
      return false unless validate_items

      self.document.save

    end # save

    def persisted?; false; end

    def ext
      self.document.ext
    end # ext

    def url
      self.document.url
    end # url

    def size
      self.document.size
    end # size

    def doc_date
      @doc_date.to_time rescue ::Time.now
    end # doc_date

    def doc_day
      doc_date.day
    end # doc_day

    def doc_month
      ::I18n.t('date.month_names')[doc_date.mon]
    end # doc_month

    def doc_year
      doc_date.year
    end # doc_year

    def contract_date
      @contract_date.to_time rescue ::Time.now
    end # contract_date

    def contract_day
      contract_date.day
    end # contract_day

    def contract_month
      ::I18n.t('date.month_names')[contract_date.mon]
    end # contract_month

    def contract_year
      contract_date.year
    end # contract_year

    def declared_value

      return @declared_value unless @declared_value.nil?

      @declared_value = self.items.inject(0) { |sum, el|
        sum += ((el[:declared_value] || el["declared_value"]).try(:to_i) || 0)
      }
      @declared_value

    end # declared_value

    def items

      return @items if @items.is_a?(Array)
      return (@items = ::JSON.parse(@items.gsub("=>", ":"))) if @items.is_a?(String) && !@items.blank?
      []

    end # items

    private

    def prepare_val(val)
      String(val).sub(/\A\s+/, "").sub(/\s+\z/, "").gsub(/(\s){2,}/, '\\1')
    end # prepare_val

    def set_defaults_if_empty

      ::Boxberry::Acts::DEFAULTS.each do |name, value|

        if self.respond_to?(name) && send(name).blank?

          method = "#{name}=".to_sym
          send(method, prepare_val(value.call) ) if self.respond_to?(method)

        end # if

      end # each

      self

    end # set_defaults_if_empty

    def validate_items

      if self.items.empty?
        self.errors.add(:items, "Укажите заказы")
        return false
      end
      true

    end # validate_items

  end # Model

end # Boxberry
