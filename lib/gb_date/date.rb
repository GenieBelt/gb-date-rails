class Date
  # @return [Time]
  def to_utc_time
    begin
      self.to_time(:utc)
    rescue
      self.to_time + self.to_time.utc_offset
    end
  end
end

class DateTime
  # @return [Time]
  def to_utc_time
    self.to_time.utc
  end
end