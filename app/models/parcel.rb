class Parcel < ActiveRecord::Base
  has_one :shipment
end
