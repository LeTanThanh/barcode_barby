class BarcodeDecorator < Draper::Decorator
  delegate_all

  def symbology_text
    Settings.barcode.symbologies.to_h[symbology.to_sym]
  end

  def symbology_service_class
    "Symbology::#{symbology.camelize}SymbologyService"
  end
end
