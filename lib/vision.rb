require 'base64'
require 'json'
require 'net/https'

module Vision
  class << self
    def get_image_data(image_file)
      api_url = "https://vision.googleapis.com/v1/images:annotate?key=#{ENV['GOOGLE_API_KEY']}"
      base64_image = Base64.encode64(image_file.tempfile.read)
      params = {
        requests: [{
          image: {
            content: base64_image
          },
          features: [
            {
              type: 'SAFE_SEARCH_DETECTION'
            }
          ]
        }]
      }.to_json

      uri = URI.parse(api_url)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri)
      request['Content-Type'] = 'application/json'
      response = https.request(request, params)
      response_body = JSON.parse(response.body)

      # NGとするラベル
      ng_label = ["POSSIBLE", "LIKELY", "VERY_LIKELY"]
      safety = true

      response_body['responses'][0]['safeSearchAnnotation'].each do |key, value|
        if ng_label.include?(value)
          safety = false
        end
      end

      safety
    end
  end
end