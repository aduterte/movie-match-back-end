class MoviesController < ApplicationController
    def index
        movies = Movie.all
        render json: movies
    end

    def show
        movie = Movie.find(params[:id])
        if movie
            render json: movie
        else
            render json: {message:  'Movie not found'}
        end
    end

    def create
        new_movie = Movie.create(movie_params)
        render json: new_movie
    end

    private

    def movie_params
        params.require(:movie).permit(:title, :backdrop_path, :adult, :imdb_id, :overview, :poster_path, :release_date, :runtime, :tagline, :original_language, :tmdb_id, :genres => [])
    end
end
