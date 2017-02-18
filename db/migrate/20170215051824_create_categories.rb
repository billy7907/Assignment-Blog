class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.text :name
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
