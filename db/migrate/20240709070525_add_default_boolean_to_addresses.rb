class AddDefaultBooleanToAddresses < ActiveRecord::Migration[7.1]
  def change
    add_column :addresses, :default, :boolean, default: false
  end
end
