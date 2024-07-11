class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string  :ancestry, collation: "C"
      t.index   :ancestry
      t.integer :position, default: 1
      t.string  :name, null: false
      t.text    :description
      t.string  :hex_bg_color
      t.string  :hex_fg_color
      t.string  :slug
      t.index   :slug, unique: true

      t.timestamps
    end
  end
end
