require 'json'
require 'faraday'

module ReadIt
  module HTTP
    def http
      @http ||= Faraday::Connection.new 'http://www.reddit.com' do |faraday|
        faraday.request :url_encoded
        faraday.adapter ReadIt.adapter
        faraday.headers["User-Agent"] = "ReadIt v#{ReadIt::VERSION}"
      end
    end
  end
end
