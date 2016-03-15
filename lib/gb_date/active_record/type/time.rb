require 'gb_date/active_record/connection_adapters/column'
module GBDate
  module ActiveRecord
    module Type
      module Time
        SECONDS_A_DAY = 86400
        DISTANCE_TO_DEFAULT_DAY = 946684800
        def cast_value(value)
          return ::Time.at(calculate_float_value value)  if value.is_a? Numeric
          if value.is_a?(::String) && value =~ ::ActiveRecord::ConnectionAdapters::Column::Format::NUMERIC_TIME
            return ::Time.at(calculate_float_value value)
          end
          super value
        end

        def fast_string_to_time(string)
          if string =~ ::ActiveRecord::ConnectionAdapters::Column::Format::NUMERIC_TIME
            ::Time.at(string.to_f)
          else
            super string
          end
        end

        private

        def calculate_float_value(value)
          DISTANCE_TO_DEFAULT_DAY + ( value.to_f % 86400.0)
        end
      end
    end
  end
end
begin
  ActiveRecord::Type::Time.send :prepend, GBDate::ActiveRecord::Type::Time
rescue
  puts 'Cannot load rails Time extension'
end