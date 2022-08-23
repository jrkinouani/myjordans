class AddImageToBaskets < ActiveRecord::Migration[7.0]
  def change
    add_column :baskets, :image, :string
  end
end
