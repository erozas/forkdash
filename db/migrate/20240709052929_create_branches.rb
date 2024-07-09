class CreateBranches < ActiveRecord::Migration[7.1]
  def change
    create_table :branches do |t|
      t.string :name
      t.text :description
      t.boolean :headquarters
      t.string :slug

      t.timestamps
    end
  end
end
