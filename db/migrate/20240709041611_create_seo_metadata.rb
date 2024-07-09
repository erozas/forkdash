class CreateSeoMetadata < ActiveRecord::Migration[7.1]
  def change
    create_table :seo_metadata do |t|
      t.references :seoable, polymorphic: true, null: false 
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
