class AddingTheCategoryIDtoDestination < ActiveRecord::Migration[5.0]
  def change
   add_column :destinations, :category_id, :integer

  end
end
