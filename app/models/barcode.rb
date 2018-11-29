class Barcode < ApplicationRecord
  enum symbology: %i(code_25 code_25_interleaved code_25_iata
                     code_39 code_93 code_128
                     ean_13 ean_8 qr_code)

  mount_uploader :image, BarcodeUploader

  after_create :gen_barcode_png_image

  class << self
    def gen_uniq_uid
      uids = Barcode.pluck :uid
      uid = rand.to_s.gsub("0.", "") while(uid.nil? || uids.include?(uid))
      uid
    end
  end

  private

  def gen_barcode_png_image
    symbology_service_class = self.decorate.symbology_service_class
    symbology_service = symbology_service_class.constantize.new self
    symbology_service.perform

    outputter_service = Outputter::PngOutputterService.new symbology_service.barby
    outputter_service.perform

    update_attributes image: File.open(outputter_service.image_path, "r")
  end
end
