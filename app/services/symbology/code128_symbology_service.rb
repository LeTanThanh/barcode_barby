require "barby"
require "barby/barcode/code_128"

module Symbology
  class Code128SymbologyService
    attr_reader :barby

    def initialize barcode
      @barcode = barcode
    end

    def perform
      @barby = Barby::Code128.new @barcode.uid
    end
  end
end
