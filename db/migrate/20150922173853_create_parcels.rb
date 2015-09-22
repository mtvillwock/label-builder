class CreateParcels < ActiveRecord::Migration
  def change
    create_table :parcels do |t|
      # Weights are in ounces and dimensions are in inches

      # accepts max 15 digits, allows specificity of 2 decimals
      t.decimal :length, precision: 15, scale: 2
      t.decimal :height, precision: 15, scale: 2
      t.decimal :width, precision: 15, scale: 2
      t.decimal :weight, precision: 15, scale: 2
      #t.string :predefined_package

      t.timestamps null: false
    end
  end
end
