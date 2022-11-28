class AddGeoActivatedToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :geo_activated, :boolean, default: false
  end
end
