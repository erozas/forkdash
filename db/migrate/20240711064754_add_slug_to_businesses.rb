class AddSlugToBusinesses < ActiveRecord::Migration[7.1]
  def change
    add_column :businesses, :slug, :string
    add_index :businesses, :slug, unique: true
  end
end
