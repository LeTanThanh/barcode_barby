require "barby"
require "barby/barcode/ean_8"

module Symbology
  class Ean8SymbologyService
    attr_reader :barby

    def initialize barcode
      @barcode = barcode
    end

    def perform
      @barby = Barby::EAN8.new @barcode.uid[0, 7]
    end
  end
end
