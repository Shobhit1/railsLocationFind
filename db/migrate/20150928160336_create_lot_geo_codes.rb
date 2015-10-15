class CreateLotGeoCodes < ActiveRecord::Migration
  def change
    create_table :lot_geo_codes do |t|
      t.text :address
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
