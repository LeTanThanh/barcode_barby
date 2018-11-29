require "barby"
require "barby/barcode/code_25_interleaved"

module Symbology
  class Code25InterleavedSymbologyService
    attr_reader :barby

    def initialize barcode
      @barcode = barcode
    end

    def perform
      @barby = Barby::Code25.new @barcode.uid
    end
  end
end
