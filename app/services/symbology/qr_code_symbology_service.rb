require "barby"
require "barby/barcode/qr_code"

module Symbology
  class QrCodeSymbologyService
    attr_reader :barby

    def initialize barcode
      @barcode = barcode
    end

    def perform
      @barby = Barby::QrCode.new @barcode.uid
    end
  end
end
