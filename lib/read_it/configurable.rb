module ReadIt
  module Configurable

    def self.keys
      [:adapter]
    end

    attr_accessor *keys

    def configure
      yield self
      self
    end

  end
end
