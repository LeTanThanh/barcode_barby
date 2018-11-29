class CreateBarcodes < ActiveRecord::Migration[5.2]
  def change
    create_table :barcodes do |t|
      t.string :uid
      t.integer :symbology
      t.string :image

      t.timestamps
    end
  end
end
