class ShipmentsController < ApplicationController

  def index
    @shipments = Shipment.all
  end

  def new
    @shipment = Shipment.new
    @to_address = Address.new
    @from_address = Address.new
    @parcel = Parcel.new
  end

  def create
    from_address_data = params[:shipment][:from_address]
    to_address_data = params[:shipment][:to_address]
    parcel_data = params[:shipment][:parcel]
    # can extract all of these into methods in the Shipment model
    # fromAddress = EasyPost::Address.create(
    #   :company => 'EasyPost',
    #   :street1 => '118 2nd Street',
    #   :street2 => '4th Floor',
    #   :city => 'San Francisco',
    #   :state => 'CA',
    #   :zip => '94105',
    #   :phone => '415-528-7555'
    # )

    # toAddress = EasyPost::Address.create(
    #   :name => 'George Costanza',
    #   :company => 'Vandelay Industries',
    #   :street1 => '1 E 161st St.',
    #   :city => 'Bronx',
    #   :state => 'NY',
    #   :zip => '10451'
    # )

    # parcel = EasyPost::Parcel.create(
    #   :predefined_package => 'FlatRateEnvelope',
    #   :weight => 10
    # )

    # parcel = EasyPost::Parcel.create(
    #   :length => 9,
    #   :width => 6,
    #   :height => 2,
    #   :weight => 10
    # )

    # shipment = EasyPost::Shipment.create(
    #   :to_address => toAddress,
    #   :from_address => fromAddress,
    #   :parcel => parcel
    # )
    redirect_to shipment_path(@shipment)
  end

  def shipment_params
    params.require(:shipment).permit(to_address_attributes: [:name, :street1, :street2],
                                     from_address_attributes: [:name, :street1, :street2],
                                     parcel_attributes: [:height, :width, :length, :weight])
  end
end
