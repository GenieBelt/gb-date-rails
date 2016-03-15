class Time
  # Seconds as BigDecimal
  # @return [BigDecimal]
  def to_decimal
    BigDecimal.new("#{self.to_i}.#{sprintf('%09d',self.nsec)}")
  end

  # Seconds as BigDecimal with precision to microseconds
  # @return [BigDecimal]
  def to_api_decimal
    BigDecimal.new("#{self.to_i}.#{sprintf('%06d',self.nsec/1000)}")
  end

  # Seconds as Float with precision to microseconds
  # @return [BigDecimal]
  def to_api_f
    self.to_api_decimal.to_f
  end

  # Return string with date represented by seconds with precision to microseconds
  # @return [String]
  def to_api_s
    sprintf('%.6f', to_api_decimal)
  end

  # Converts time to DateTime
  # @return DateTime
  def to_datetime
    # Convert seconds + microseconds into a fractional number of seconds
    seconds = sec + Rational(usec, 10**6)

    # Convert a UTC offset measured in minutes to one measured in a
    # fraction of a day.
    offset = Rational(utc_offset, 60 * 60 * 24)
    DateTime.new(year, month, day, hour, min, seconds, offset)
  end
end