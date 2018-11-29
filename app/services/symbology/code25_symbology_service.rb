require "barby"
require "barby/barcode/code_25"

module Symbology
  class Code25SymbologyService
    attr_reader :barby

    def initialize barcode
      @barcode = barcode
    end

    def perform
      @barby = Barby::Code25.new @barcode.uid
    end
  end
end
