require 'date'

class Package
  attr_accessor :id, :carrier_type, :shipping_date, :origin_country, :destination_country 

  def initialize(informations:)
    @informations = informations
    @id = informations['id']
    @carrier_type = informations['carrier']
    @shipping_date = Date.parse(informations['shipping_date'])
    @origin_country = informations['origin_country']
    @destination_country = informations['destination_country']
  end
end 