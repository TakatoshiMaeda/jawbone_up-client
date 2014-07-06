module JawboneUp
  class Client
    class Configuration
      include ActiveSupport::Configurable

      config_accessor :client_id
      config_accessor :app_secret
    end
  end
end
