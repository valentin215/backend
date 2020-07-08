require 'date'
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
    potential_delivery_days = carrier.delivery_promise + 1
    delayed_days = 0
    range_date = package.shipping_date + potential_delivery_days
    (package.shipping_date..range_date).each do |date|
      puts date
      if date.saturday? && carrier.saturday_deliveries == false
        delayed_days += 1
      elsif date.sunday?
        delayed_days += 1
      end 
    end
    final_date = (package.shipping_date + potential_delivery_days + delayed_days).to_s 
    final_date
  end 
end 