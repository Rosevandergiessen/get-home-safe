class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :category

      t.timestamps
    end
  end
end
