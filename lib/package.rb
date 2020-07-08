require 'date'

class Package
  attr_accessor :id, :carrier_type, :shipping_date

  def initialize(informations:)
    @informations = informations
    @id = informations['id']
    @carrier_type = informations['carrier']
    @shipping_date = Date.parse(informations['shipping_date'])
  end
end 