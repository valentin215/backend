require 'json'
require_relative '../lib/json_response'

response = JsonResponse.new(json_input: "../level2/data/input.json")
@hash_deliveries = response.deliveries_generator.to_json
puts @hash_deliveries