# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts 'Cleaning database...'
Movie.destroy_all

puts 'Creating movies...'
10.times do
  attributes = {
    title: Faker::Movie.title,
    overview: Faker::Movie.quote,
    rating: Faker::Number.between(from: 1, to: 10)
  }
  movie = Movie.create!(attributes)
  puts "Created #{movie.title}"
end
puts 'Completed creations'
