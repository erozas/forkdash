class AddBusinessIdToBranches < ActiveRecord::Migration[7.1]
  def change
    add_reference :branches, :business, foreign_key: true
  end
end
