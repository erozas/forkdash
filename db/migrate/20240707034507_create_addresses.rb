class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true, null: false
      t.string :line_1, null: false
      t.string :line_2
      t.string :apt_number
      t.string :zip_code
      t.string :city
      t.string :country
      t.decimal :lat, null: false, precision: 10, scale: 6
      t.decimal :lng, null: false, precision: 10, scale: 6
      t.string :google_place_id

      t.timestamps
    end
  end
end
