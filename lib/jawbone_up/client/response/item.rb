module JawboneUp
  class Client
    class Response
      class Item < OpenStruct
        TYPES = {
          'time_created'   => DateTime,
          'time_completed' => DateTime,
          'date'           => Date,
          'place_lat'      => Float,
          'place_lon'      => Float,
          'snapshot_image' => URI
        }

        def initialize(hash)
          super(normarize(hash))
        end

        private

        def normarize(hash)
          TYPES.each do |key, type|
            if hash.has_key?(key)
              hash[key] = cast(hash[key], type)
            end
          end
          hash
        end

        def cast(value, type)
          if type == DateTime
            DateTime.strptime(value.to_s, '%s')
          elsif type == Date
            Date.parse(value.to_s)
          elsif type == Float
            value.to_f
          elsif type == URI
            "#{JawboneUp::Client::BASE_URL}#{value}"
          else
            value
          end
        end
      end
    end
  end
end
