class AddanAttributeToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :supermarkets, :string
  end
end
