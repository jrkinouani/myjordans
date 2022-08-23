class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :basket, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :total_price
      t.string :status

      t.timestamps
    end
  end
end
