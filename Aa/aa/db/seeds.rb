# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(username: "felipe",
    email: "felipe@ejemplo.com",
    password: "password",
    password_confirmation: "password")
User.create(username: "martin",
    email: "martin@ejemplo.com",
    password: "password",
    password_confirmation: "password")
User.create(username: "clemente",
    email: "clemente@ejemplo.com",
    password: "password",
    password_confirmation: "password")

#create 50 messages

50.times do
    Message.create(
        body: Faker::Lorem.sentence(word_count:10),
        user_id: rand(1..3)
    )
end