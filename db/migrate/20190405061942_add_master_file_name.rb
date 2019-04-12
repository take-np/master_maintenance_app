class AddMasterFileName < ActiveRecord::Migration[5.2]
  def change
    add_column :masters, :file_name, :string
    add_column :masters, :user_name, :string
  end
end
