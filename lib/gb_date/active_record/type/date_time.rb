require 'gb_date/active_record/connection_adapters/column'
module GBDate
  module ActiveRecord
    module Type
      module DateTime
        def cast_value(value)
          return ::Time.at(value) if value.is_a? Numeric
          super value
        end

        def type_cast_for_database(value)
          value = ::Time.at(value) if value.is_a? Numeric
          super value
        end

        def fast_string_to_time(string)
          if string =~ ::ActiveRecord::ConnectionAdapters::Column::Format::NUMERIC_TIME
            ::Time.at(string.to_f)
          else
            super string
          end
        end
      end
    end
  end
end
begin
  ActiveRecord::Type::DateTime.send :prepend, GBDate::ActiveRecord::Type::DateTime
  require 'active_record/connection_adapters/postgresql_adapter'
  ActiveRecord::ConnectionAdapters::PostgreSQL::OID::DateTime.send :prepend, GBDate::ActiveRecord::Type::DateTime
rescue Exception => e
  puts e.message
end