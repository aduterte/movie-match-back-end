# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
User.destroy_all
Movie.destroy_all
Favorite.destroy_all

#------------------------ MOVIES -------------------------

m1 = RestClient.get 'https://api.themoviedb.org/3/movie/popular?api_key=b94d0b3b408ccf74d9f49bb39a64a13b&language=en-US&page=1'
m2 = RestClient.get 'https://api.themoviedb.org/3/movie/popular?api_key=b94d0b3b408ccf74d9f49bb39a64a13b&language=en-US&page=2'
m3 = RestClient.get 'https://api.themoviedb.org/3/movie/popular?api_key=b94d0b3b408ccf74d9f49bb39a64a13b&language=en-US&page=3'
m4 = RestClient.get 'https://api.themoviedb.org/3/movie/popular?api_key=b94d0b3b408ccf74d9f49bb39a64a13b&language=en-US&page=4'

m1arr = JSON.parse(m1)["results"]
m2arr = JSON.parse(m2)["results"]
m3arr = JSON.parse(m3)["results"]
m4arr = JSON.parse(m4)["results"]

m1arr.each do |movie|
    x = RestClient.get "https://api.themoviedb.org/3/movie/#{movie['id']}?api_key=b94d0b3b408ccf74d9f49bb39a64a13b&language=en-US"
    resp = JSON.parse(x)
    genres = []
    resp["genres"].each {|x| genres << x["name"]}
    Movie.create(
        title: resp["title"],
        backdrop_path: resp["backdrop_path"],
        adult: resp["adult"],
        overview: resp["overview"],
        poster_path: resp["poster_path"],
        release_date: resp["release_date"],
        runtime: resp["runtime"],
        imdb_id: resp["imdb_id"],
        tagline: resp["tagline"],
        original_language: resp["original_language"],
        genres: genres,
        tmdb_id: resp["id"]
    )
end

m2arr.each do |movie|
    x = RestClient.get "https://api.themoviedb.org/3/movie/#{movie['id']}?api_key=b94d0b3b408ccf74d9f49bb39a64a13b&language=en-US"
    resp = JSON.parse(x)
    genres = []
    resp["genres"].each {|x| genres << x["name"]}
    Movie.create(
        title: resp["title"],
        backdrop_path: resp["backdrop_path"],
        adult: resp["adult"],
        overview: resp["overview"],
        poster_path: resp["poster_path"],
        release_date: resp["release_date"],
        runtime: resp["runtime"],
        imdb_id: resp["imdb_id"],
        tagline: resp["tagline"],
        original_language: resp["original_language"],
        genres: genres,
        tmdb_id: resp["id"]
    )
end

m3arr.each do |movie|
    x = RestClient.get "https://api.themoviedb.org/3/movie/#{movie['id']}?api_key=b94d0b3b408ccf74d9f49bb39a64a13b&language=en-US"
    resp = JSON.parse(x)
    genres = []
    resp["genres"].each {|x| genres << x["name"]}
    Movie.create(
        title: resp["title"],
        backdrop_path: resp["backdrop_path"],
        adult: resp["adult"],
        overview: resp["overview"],
        poster_path: resp["poster_path"],
        release_date: resp["release_date"],
        runtime: resp["runtime"],
        imdb_id: resp["imdb_id"],
        tagline: resp["tagline"],
        original_language: resp["original_language"],
        genres: genres,
        tmdb_id: resp["id"]
    )
end

m4arr.each do |movie|
    x = RestClient.get "https://api.themoviedb.org/3/movie/#{movie['id']}?api_key=b94d0b3b408ccf74d9f49bb39a64a13b&language=en-US"
    resp = JSON.parse(x)
    genres = []
    resp["genres"].each {|x| genres << x["name"]}
    Movie.create(
        title: resp["title"],
        backdrop_path: resp["backdrop_path"],
        adult: resp["adult"],
        overview: resp["overview"],
        poster_path: resp["poster_path"],
        release_date: resp["release_date"],
        runtime: resp["runtime"],
        imdb_id: resp["imdb_id"],
        tagline: resp["tagline"],
        original_language: resp["original_language"],
        genres: genres,
        tmdb_id: resp["id"]
    )
end

User.create(username: "Alex", email:"alexduterte@gmail.com", password: "pass")

Favorite.create(user: User.first, movie: Movie.first)

# t.string "email"
# t.string "username"
# t.string "password"
# t.string "avatar"