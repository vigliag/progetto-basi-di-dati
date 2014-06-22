class CreateScreens < ActiveRecord::Migration
  def change
    create_table :screens do |t|
      t.boolean :avaiable
      t.text :seats_string

      t.timestamps
    end
  end
end
