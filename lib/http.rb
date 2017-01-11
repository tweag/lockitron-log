require 'net/http'
require 'net/https'

module HTTP
  def self.https_post_json(url, data, headers = {})
    uri = URI(url)
    Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https', verify_mode: OpenSSL::SSL::VERIFY_NONE) do |https|
      req_headers = {
        'Content-Type' => 'application/json',
        'Accept'       => 'application/json',
      }.merge(headers)

      req = Net::HTTP::Post.new(uri.path, req_headers)

      req.body = data.to_json

      res = https.request(req)

      res.body
    end
  end
end
