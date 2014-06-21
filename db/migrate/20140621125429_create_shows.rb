class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.integer :movie_id
      t.datetime :start
      t.integer :screen_id
      t.decimal :price

      t.timestamps
    end
  end
end
