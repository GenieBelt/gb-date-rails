class Numeric
  def to_date
    Time.at(self).utc.to_date
  end

  def to_time
    Time.at(self).utc
  end

  def to_datetime
    Time.at(self).utc.to_datetime
  end

  def in_time_zone(*args)
    Time.at(self).in_time_zone(*args)
  end
end