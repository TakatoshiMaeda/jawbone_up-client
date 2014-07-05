module JawboneUp
  module Client
    include ActiveSuppoer::Configurable

    config_accessor :client_id
    config_accessor :app_secret
  end
end
