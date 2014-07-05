require "jawbone_up/client/version"

module JawboneUp
  module Client
    def self.configure(&block)
      yield config
    end

    def self.config
      @config ||= Configuration.new
    end
  end
end
