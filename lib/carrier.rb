class Carrier
  attr_accessor :code, :delivery_promise, :saturday_deliveries

  def initialize(informations:)
    @informations = informations
    @code = informations['code']
    @delivery_promise = informations['delivery_promise']
    @saturday_deliveries = informations['saturday_deliveries']
  end
end 