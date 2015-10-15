class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.text :address
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
