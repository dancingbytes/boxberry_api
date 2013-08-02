# encoding: utf-8
#
# Акт приема-передачи отправлений
#
module Boxberry

  class AcceptanceReport < ::Boxberry::Document

    def initialize(datas)

      # Переменные
      @snippets = ::Boxberry::Acts::Snippets.new(datas)

      # Название файла документа
      @file_name = "acceptance_report"

    end # new

    class Model < ::Boxberry::Model

      def document
        @document ||= ::Boxberry::AcceptanceReport.new(self)
      end # document

    end # Model

  end # AcceptanceReport

end # Boxberry
