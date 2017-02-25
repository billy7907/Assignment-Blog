class ChangeColumnUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :is_admin, :string
    add_column :users, :is_admin, :boolean, default: false
  end
end
