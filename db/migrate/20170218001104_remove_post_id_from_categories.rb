class RemovePostIdFromCategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :post_id, :integer
  end
end
