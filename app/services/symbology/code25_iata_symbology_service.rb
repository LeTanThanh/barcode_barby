require "barby"
require "barby/barcode/code_25_iata"

module Symbology
  class Code25IataSymbologyService
    attr_reader :barby

    def initialize barcode
      @barcode = barcode
    end

    def perform
      @barby = Barby::Code25IATA.new @barcode.uid
    end
  end
end
