module JawboneUp
  class Client
    class Response
      class Meta < OpenStruct
        def initialize(response)
          @metadata = JSON.parse(response)['meta']
          @metadata['time'] = Time.at(@metadata['time'].to_i)
          super(@metadata)
        end
      end
    end
  end
end
