# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# building cities (requires nothing)
10.times do
  City.create!(name: Faker::Address.unique.city, zipcode: Faker::Address.unique.zip)
end

# create some users (requires cities)
10.times do
  name = Faker::FunnyName.unique.two_word_name
  description = Faker::Lorem.sentence(word_count: 10,random_words_to_add: 5)
  email = Faker::Internet.unique.safe_email(name: name)
  name = name.split(' ')
  age = rand(16..70)

  # creating the users based on random city
  City.all.sample.users.create!(
    first_name: name[0], last_name: name[1],
    description: description, email: email, age: age,
  )
end

# getting to the gossips (requires users)
20.times do
  title = Faker::Book.unique.title[0..rand(2..13)]
  content = ([Faker::Lorem.sentence(word_count: 10, random_words_to_add: 15)] * rand(6..10)).join(' ')
  User.all.sample.gossips.create!(
    title: title, content: content
  )
end
