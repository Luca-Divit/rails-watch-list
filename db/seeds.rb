# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "json"
require "open-uri"
Movie.destroy_all
puts "There are #{Movie.count} movies"
puts "----------------------------"
puts "----------------------------"
puts "Creating movies....."


for i in (1..10).to_a do
  url = "https://api.themoviedb.org/3/movie/popular?api_key=#{ENV["MOVIE_DB"]}&language=en-US&page=#{i}"
  movies_json_string = URI.open(url).read
  movies_json = JSON.parse(movies_json_string)
  movies_json['results'].each do |movie|
    Movie.create(title: movie['title'], overview: movie['overview'], poster_url: "https://image.tmdb.org/t/p/original/#{movie['poster_path']}", rating: movie['vote_average'])
  end
end
puts "Created #{Movie.count} movies"

# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

# List.create(name: 'Classic movies')
# List.create(name: 'Superhero')
# List.create(name: 'Comedies')

# Bookmark.create(movie_id: 1, list_id: 2, comment: 'Best superhero movie of all times worth a watch')
# Bookmark.create(movie_id: 2, list_id: 1, comment: 'Very old movie if you are bored you can give it a go')
# Bookmark.create(movie_id: 3, list_id: 1, comment: 'There was space for two on that door...')
# Bookmark.create(movie_id: 4, list_id: 3, comment: 'Nice jokes on that movie, but just a copy of the other oceans')
