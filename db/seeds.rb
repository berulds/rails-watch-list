# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require 'open-uri'

puts 'Cleaning database...'
Movie.destroy_all

url = 'http://tmdb.lewagon.com/movie/top_rated?'

response = URI.open(url)
data = JSON.parse(response.read)
random_movies = data['results'].sample(10)
random_movies.each do |movie_data|
  title = movie_data['title']
  overview = movie_data['overview']
  poster_url = "https://image.tmdb.org/t/p/w200#{movie_data['poster_path']}"
  rating = movie_data['vote_average'].round
  Movie.create({ title: title, overview: overview, poster_url: poster_url, rating: rating })
end

# puts 'Creating movies...'
# 10.times do
#   attributes = {
#     title: Faker::Movie.title,
#     overview: Faker::Movie.quote,
#     rating: Faker::Number.between(from: 1, to: 10)
#   }
#   movie = Movie.create!(attributes)
#   puts "Created #{movie.title}"
# end
puts 'Completed creations'
