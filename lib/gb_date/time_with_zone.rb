require 'active_support'
class ActiveSupport::TimeWithZone

  # Seconds as BigDecimal
  # With precision to nanoseconds
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
    sprintf('%.6f', self.to_api_decimal)
  end
end