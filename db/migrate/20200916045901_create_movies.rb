class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genres # possibly has many genres / genres belong to .... might mess up api though.
      t.string :backdrop_path
      t.boolean :adult
      t.string :imdb_id
      t.text :overview
      t.string :poster_path
      t.string :release_date
      t.integer :runtime
      t.string :tagline
      t.string :original_language
      t.string :tmdb_id

      t.timestamps
    end
  end
end
