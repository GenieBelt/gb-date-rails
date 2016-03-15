require 'gb_date/active_record/connection_adapters/column'
module GBDate
  module String
    module Time
      def to_time
        if self =~ ::ActiveRecord::ConnectionAdapters::Column::Format::NUMERIC_TIME
          ::Time.at(self.to_f)
        else
          super
        end
      end

      def in_time_zone(zone = ::Time.zone)
        if zone && self =~ ::ActiveRecord::ConnectionAdapters::Column::Format::NUMERIC_TIME
          ::Time.find_zone!(zone).at(self.to_f)
        else
          super
        end
      end
    end
  end
end

class String
  prepend GBDate::String::Time
end