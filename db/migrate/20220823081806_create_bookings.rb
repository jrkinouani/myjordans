class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :basket_id
      t.datetime :start_date
      t.datetime :end_date
      t.integer :total_price
      t.string :status

      t.timestamps
    end
  end
end
