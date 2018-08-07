# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
puts "create users with standard role"
10.times do
  User.create!(
    email:        Faker::Internet.email,
    username:     Faker::Internet.username,
    password: 	  "password",
    confirmed_at: DateTime.now

  )
end

puts "create users with premium role"
5.times do
  User.create!(
    email: 	  	 Faker::Internet.email,
    username: 	 Faker::Internet.username,
    password: 	 "password",
    role:     	 "premium",
    confirmed_at: DateTime.now
  )
end

puts "create users with admin role"
2.times do
  User.create!(
    email: 	  		Faker::Internet.email,
    username: 		Faker::Internet.username,
    password: 		"password",
    role:     		"admin",
    confirmed_at: DateTime.now
  )
end

puts "create wikis"
30.times do
	Wiki.create!(
		title: 	 Faker::Lorem.sentence(3),
		body:  	 Faker::Lorem.paragraph(2, false, 4),
		private: [true, false].sample,
		user: 	 User.all.sample
	)
end
