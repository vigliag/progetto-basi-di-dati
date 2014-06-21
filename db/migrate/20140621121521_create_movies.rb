class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :length
      t.integer :year
      t.text :description
      t.string :country

      t.timestamps
    end
  end
end
