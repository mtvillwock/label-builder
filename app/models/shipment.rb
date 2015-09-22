class Shipment < ActiveRecord::Base
  has_one :to_address
  has_one :from_address
  has_one :parcel

  accepts_nested_attributes_for :to_address, :from_address, :parcel
end
