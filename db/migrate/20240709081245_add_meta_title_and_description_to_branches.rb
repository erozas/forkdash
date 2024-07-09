class AddMetaTitleAndDescriptionToBranches < ActiveRecord::Migration[7.1]
  def change
    add_column :branches, :meta_title, :string
    add_column :branches, :meta_description, :string
  end
end
