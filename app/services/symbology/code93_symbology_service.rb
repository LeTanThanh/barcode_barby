require "barby"
require "barby/barcode/code_93"

module Symbology
  class Code93SymbologyService
    attr_reader :barby

    def initialize barcode
      @barcode = barcode
    end

    def perform
      @barby = Barby::Code93.new @barcode.uid
    end
  end
end
