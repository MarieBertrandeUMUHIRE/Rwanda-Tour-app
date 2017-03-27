class AddingImageColumn < ActiveRecord::Migration[5.0]
  def change
   add_column :destinations, :image, :string
  end
end
