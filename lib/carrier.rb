class Carrier
  attr_accessor :code, :delivery_promise, :saturday_deliveries, :oversea_delay_threshold 

  def initialize(informations:)
    @informations = informations
    @code = informations['code']
    @delivery_promise = informations['delivery_promise']
    @saturday_deliveries = informations['saturday_deliveries']
    @oversea_delay_threshold = informations['oversea_delay_threshold']
  end
end 