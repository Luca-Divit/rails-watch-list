class UpdatePosterUrlOnMovies < ActiveRecord::Migration[7.0]
  def change
    rename_column :movies, :poste_url, :poster_url
  end
end
