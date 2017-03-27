class DeletingImageColumn < ActiveRecord::Migration[5.0]
  def change
   remove_column :destinations, :image, :string
  end
end
