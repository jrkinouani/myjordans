class CreateBaskets < ActiveRecord::Migration[7.0]
  def change
    create_table :baskets do |t|
      t.string :name
      t.text :description
      t.integer :size
      t.integer :price_per_day

      t.timestamps
    end
  end
end
