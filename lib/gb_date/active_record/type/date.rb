require 'gb_date/active_record/connection_adapters/column'
module GBDate
  module ActiveRecord
    module Type
      module Date
        def fast_string_to_date(string)
          if string =~ ::ActiveRecord::ConnectionAdapters::Column::Format::NUMERIC_TIME
            ::Time.at(string.to_f).utc.to_date
          else
            super(string)
          end
        end
      end
    end
  end
end

begin
  require 'active_record/type/date'
  ActiveRecord::Type::Date.send :prepend, GBDate::ActiveRecord::Type::Date
rescue
  puts 'Cannot load rails Date extension'
end