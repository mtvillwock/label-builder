class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.integer :to_address_id
      t.integer :from_address_id
      t.integer :parcel_id

      t.timestamps null: false
    end
  end
end
