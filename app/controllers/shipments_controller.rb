class ShipmentsController < ApplicationController

  def index
    @shipments = Shipment.all
  end

  def show
    @shipment = Shipment.where(id: params[:id]).first
  end

  def new
    @shipment = Shipment.new
    @to_address = Address.new
    @from_address = Address.new
    @parcel = Parcel.new
  end

  def create
    EasyPost.api_key = ENV["LIVE_KEY"]

    @shipment = Shipment.new
    puts "from_address data"
    p from_address_data = params[:shipment][:from_address]
    puts "to_address data"
    p to_address_data = params[:shipment][:to_address]
    puts "parcel_data"
    p parcel_data = params[:shipment][:parcel]

    puts "EasyPost fromAddress"
    p fromAddress = EasyPost::Address.create(
      name: from_address_data[:name],
      company: from_address_data[:company],
      street1: from_address_data[:street1],
      street2: from_address_data[:street2],
      city: from_address_data[:city],
      state: from_address_data[:state],
      zip: from_address_data[:zip]
    )

    puts "EasyPost toAddress"
    toAddress = EasyPost::Address.create(
      name: to_address_data[:name],
      company: to_address_data[:company],
      street1: to_address_data[:street1],
      street2: to_address_data[:street2],
      city: to_address_data[:city],
      state: to_address_data[:state],
      zip: to_address_data[:zip]
    )

    puts "EasyPost parcel"
    parcel = EasyPost::Parcel.create(
      length: parcel_data[:length],
      width: parcel_data[:width],
      height: parcel_data[:height],
      weight: parcel_data[:weight]
    )

    puts "EasyPost shipment"
    shipment = EasyPost::Shipment.create(
      :to_address => toAddress,
      :from_address => fromAddress,
      :parcel => parcel
    )
    if shipment
      shipment.buy(
        :rate => shipment.lowest_rate
      )
      @url = shipment.postage_label.label_url
      @shipment.url = @url
      @shipment.save
      redirect_to shipment_path(@shipment)
    else
      render 'new'
    end
  end

  def shipment_params
    params.require(:shipment).permit(to_address_attributes: [:name, :street1, :street2],
                                     from_address_attributes: [:name, :street1, :street2],
                                     parcel_attributes: [:height, :width, :length, :weight])
  end
end
