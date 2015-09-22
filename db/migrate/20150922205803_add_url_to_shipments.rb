class AddUrlToShipments < ActiveRecord::Migration
  def change
    add_column :shipments, :url, :string
  end
end
