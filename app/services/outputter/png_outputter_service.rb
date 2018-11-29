require "barby"
require "barby/outputter/png_outputter"

module Outputter
  class PngOutputterService
    attr_reader :image_path

    def initialize barby
      @barby = barby
      @barby_outputter = Barby::PngOutputter.new @barby
    end

    def perform
      image_dir = Rails.root.join("public/images/barcode")
      FileUtils.mkdir_p(image_dir) unless File.directory?(image_dir)

      @blob = @barby_outputter.to_png
      @image_path = "public/images/barcode/#{@barby.data}.png"

      File.open(@image_path, "wb") do |f|
        f.write @blob
      end
    end
  end
end
