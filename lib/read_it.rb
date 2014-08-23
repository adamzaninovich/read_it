require "read_it/version"
require "read_it/configurable"
require "read_it/http"
require "read_it/sub"
require "read_it/post"

module ReadIt
  extend ReadIt::Configurable
  extend ReadIt::HTTP
  self.adapter = Faraday.default_adapter

  def self.sub name
    Sub.new name
  end
end

# Configuration Example
#
# ReadIt.configure do |config|
#   config.adapter = <faraday adapter>
# end
