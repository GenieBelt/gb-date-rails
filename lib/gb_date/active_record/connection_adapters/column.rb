require 'active_record'
module ActiveRecord
  module ConnectionAdapters
    class Column
      module Format
        NUMERIC_TIME = /\A\d+(\.\d+)?\z/
      end
    end
  end
end
