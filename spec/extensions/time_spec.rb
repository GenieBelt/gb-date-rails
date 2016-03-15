require 'spec_helper'

describe Time do

  it 'should respond to_decimal' do
    expect(Time.at(1234567890.12345678900).to_decimal).to eq BigDecimal.new('1234567890.123456716')
    expect(Time.at(1234567890.00005678900).to_decimal).to eq BigDecimal.new('1234567890.000056743')
  end

  it 'should respond to_api_decimal' do
    expect(Time.at(1234567890.123456789012345).to_api_decimal).to eq BigDecimal.new('1234567890.123456')
    expect(Time.at(1234567890.000056789012345).to_api_decimal).to eq BigDecimal.new('1234567890.000056')
  end

  it 'should respond to_api_f' do
    expect(Time.at(1234567890.123456789012345).to_api_f).to eq 1234567890.123456
    expect(Time.at(1234567890.000056789012345).to_api_f).to eq 1234567890.000056
  end

  it 'should respond to_api_s' do
    expect(Time.at(1234567890.123456789012345).to_api_s).to eq '1234567890.123456'
    expect(Time.at(1234567890.000056789012345).to_api_s).to eq '1234567890.000056'
  end

  it 'should respond to_datetime' do
    expect(Time.now.to_datetime).to be_a_kind_of DateTime
  end
end