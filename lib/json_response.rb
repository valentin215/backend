require 'json'
require_relative 'carrier'
require_relative 'package'
require_relative 'delivery'

class JsonResponse
  attr_accessor :json_input

  def initialize(json_input:)
    @json_input = JSON.parse(open(json_input).read)
  end
  
  def deliveries_generator
    hash_carriers = {}
    @json_input.dig('carriers').each do |carrier_informations|
      hash_carriers[carrier_informations['code']] = carrier_informations
    end 

    packages = @json_input.dig('packages').map do |package_informations|
      Package.new(informations: package_informations)
    end
    
    deliveries = packages.map do |package|
      Delivery.new(package: package, carrier: Carrier.new(informations: hash_carriers[package.carrier_type]))
    end

    final_deliveries = {}
    arr_deliveries = []
    deliveries.each do |delivery|
      arr_deliveries << {
         "package_id": delivery.package_id,
        "expected_delivery": delivery.expected_date
      }
    end
    final_deliveries["deliveries"] = arr_deliveries
  end 
end 