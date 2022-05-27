class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :overview
      t.string :poste_url
      t.float :rating

      t.timestamps
    end
  end
end
