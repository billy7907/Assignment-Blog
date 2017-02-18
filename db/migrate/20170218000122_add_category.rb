class AddCategory < ActiveRecord::Migration[5.0]
  def change

    Category.create(name: 'Personal')
    Category.create(name: 'Business')
    Category.create(name: 'Journal')
    Category.create(name: 'Politics')

    add_column :posts, :category_id, :integer
    add_foreign_key :posts, :categories


  end
end
