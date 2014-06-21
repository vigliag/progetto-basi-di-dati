class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :show_id
      t.string :seat
      t.integer :purchase_id

      t.timestamps
    end
  end
end
