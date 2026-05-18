require 'net/http'
require 'uri'
require 'json'

class ApiClient
  BASE_URL = ENV.fetch('API_BASE_URL', 'http://localhost:3101')
  
  def self.get(endpoint)
    uri = URI("#{BASE_URL}#{endpoint}")
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body) if response.is_a?(Net::HTTPSuccess)
  rescue JSON::ParserError, SocketError, Errno::ECONNREFUSED => e
    Rails.logger.error "API Error: #{e.message}"
    nil
  end
  
  def self.post(endpoint, data = {})
    uri = URI("#{BASE_URL}#{endpoint}")
    http = Net::HTTP.new(uri.host, uri.port)
    req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
    req.body = data.to_json
    response = http.request(req)
    JSON.parse(response.body) if response.is_a?(Net::HTTPSuccess)
  rescue JSON::ParserError, SocketError, Errno::ECONNREFUSED => e
    Rails.logger.error "API Error: #{e.message}"
    nil
  end
end