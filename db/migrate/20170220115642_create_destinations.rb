class CreateDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :description
      t.integer :user_id
      t.integer :region_id

      t.timestamps
    end
  end
end
