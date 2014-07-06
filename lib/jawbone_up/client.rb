require 'restclient'
require 'active_support/all'
require "jawbone_up/client/version"
require 'jawbone_up/client/configuration'
require 'jawbone_up/client/response'

module JawboneUp
  class Client
    BASE_URL = "https://jawbone.com"

    API_VERSION = "v.1.1"

    API_URL  = "#{BASE_URL}/nudge/api/#{API_VERSION}"

    def self.configure(&block)
      yield config
    end

    def self.config
      @config ||= Configuration.new
    end

    def initialize(token)
      @token = token
    end

    def get(path, params: {}, headers: {})
      request(:get, path, params: params, headers: headers)
    end

    def post(path, payload: nil, params: {}, headers: {})
      request(:post, path, payload: payload, params: params, headers: headers)
    end

    def put(path, payload: nil, params: {}, headers: {})
      request(:put, path, payload: payload, params: params, headers: headers)
    end

    def delete(path, params: {}, headers: {})
      request(:delete, path, params: params, headers: headers)
    end

    private

    def request(method, path, payload: nil, params: {}, headers: {})
      Response.new(
        RestClient::Request.execute(
          method:  method,
          url:     "#{API_URL}#{path}",
          payload: payload,
          headers: {
            params: params,
            authorization: "Bearer #{@token}"
          }.merge(headers)
        )
      )
    end
  end
end
