require "barby"
require "barby/barcode/ean_13"

module Symbology
  class Ean13SymbologyService
    attr_reader :barby

    def initialize barcode
      @barcode = barcode
    end

    def perform
      @barby = Barby::EAN13.new @barcode.uid[0, 12]
    end
  end
end
