require_relative 'carrier'
require_relative 'package'

class Delivery
  attr_accessor :carrier, :package

  def initialize(carrier:, package:)
    @carrier = carrier
    @package = package
  end

  def package_id
    package.id
  end
  
  def expected_date
    (package.shipping_date + carrier.delivery_promise + 1).to_s
  end 
end 