# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: 'Billy', last_name: 'Hung', email: 'billy7907@gmail.com', password: '123')

5.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '12345')
end


Category.create(name: 'Personal')
Category.create(name: 'Business')
Category.create(name: 'Journal')
Category.create(name: 'Politics')


10.times do
  Post.create(title: Faker::Book.title, body: Faker::Lorem.paragraph(5), category_id: 2, user_id: 1)
end
