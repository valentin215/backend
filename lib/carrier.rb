class Carrier
  attr_accessor :code, :delivery_promise

  def initialize(informations:)
    @informations = informations
    @code = informations['code']
    @delivery_promise = informations['delivery_promise']
  end
end 