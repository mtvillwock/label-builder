class Shipment < ActiveRecord::Base
  belongs_to :to_address, class_name: "Address", foreign_key: "to_address_id"
  belongs_to :from_address, class_name: "Address", foreign_key: 'from_address_id'
  belongs_to :parcel

  # accepts_nested_attributes_for :to_address, :from_address, :parcel
end
