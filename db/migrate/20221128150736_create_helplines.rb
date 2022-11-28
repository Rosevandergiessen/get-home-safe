class CreateHelplines < ActiveRecord::Migration[7.0]
  def change
    create_table :helplines do |t|
      t.string :name
      t.text :description
      t.string :url
      t.string :phone_number

      t.timestamps
    end
  end
end
