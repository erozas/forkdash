class CreatePhoneNumbers < ActiveRecord::Migration[7.1]
  def change
    create_table :phone_numbers do |t|
      t.references :phoneable, polymorphic: true, null: false
      t.string :area_code, null: false
      t.string :number, null: false
      t.string :extension
      t.boolean :default, default: false
      t.boolean :verified, default: false
      t.boolean :banned, default: false

      t.timestamps
    end
  end
end
