class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.integer :flight_id
      t.string :name
      t.decimal :baggage

      t.timestamps null: false
    end
  end
end
