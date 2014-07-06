require 'jawbone_up/client/response/meta'
require 'jawbone_up/client/response/item'

module JawboneUp
  class Client
    class Response
      include Enumerable

      def initialize(response)
        @response = response
      end

      def code
        @response.code
      end

      def headers
        @response.headers
      end

      def meta
        @meta ||= Meta.new(@response)
      end

      def each
        if data.has_key?('items')
          data['items'].each do |item|
            yield Item.new(item)
          end
        else
          yield Item.new(data)
        end
      end

      def [](key)
        data[key]
      end

      private

      def data
        @data ||= JSON.parse(@response)['data']
      end
    end
  end
end
