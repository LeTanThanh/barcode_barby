module BarcodesHelper
  def barcode_symbology_choices
    Settings.barcode.symbologies.to_h.to_a.map(&:reverse)
  end
end
