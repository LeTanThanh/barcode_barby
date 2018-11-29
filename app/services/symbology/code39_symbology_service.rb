require "barby"
require "barby/barcode/code_39"

module Symbology
  class Code39SymbologyService
    attr_reader :barby

    def initialize barcode
      @barcode = barcode
    end

    def perform
      @barby = Barby::Code39.new @barcode.uid
    end
  end
end
