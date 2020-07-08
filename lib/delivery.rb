require 'date'
require_relative 'carrier'
require_relative 'package'

class Delivery
  attr_accessor :carrier, :package, :country_distance

  def initialize(carrier:, package:, country_distance:)
    @carrier = carrier
    @package = package
    @country_distance = country_distance
  end

  def package_id
    package.id
  end
  
  def expected_date
    potential_delivery_days = carrier.delivery_promise + 1
    delayed_days = 0
    range_date = package.shipping_date + potential_delivery_days
    (package.shipping_date..range_date).each do |date|
      if date.saturday? && carrier.saturday_deliveries == false
        delayed_days += 1
      elsif date.sunday?
        delayed_days += 1
      end 
    end
    final_date = (package.shipping_date + potential_delivery_days + delayed_days + oversea_delay).to_s 
    final_date
  end 

  def oversea_delay
    (get_distance / carrier.oversea_delay_threshold).to_i
  end 

  private 

  def get_distance
    ok = @country_distance.dig(package.origin_country).dig(package.destination_country)
  end 
end 