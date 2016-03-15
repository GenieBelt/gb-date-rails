require 'spec_helper'
describe Numeric do

  context 'Float' do
    it 'should respond to_date' do
      expect(170000.0.to_date).to eq Date.new(1970, 1, 2)
    end

    it 'should respond to_time' do
      expect(1702121200.332.to_time).to eq Time.at(1702121200.332)
    end

    it 'should respond to_datetime' do
      float = rand(100000000) + 0.0
      expect(float.to_datetime).to eq DateTime.parse(Time.at(float).utc.to_s)
    end

    it 'should respond to_timezone' do
      float = rand(100000000) + 0.0
      expect(float.in_time_zone 'Poland').to eq Time.at(float).in_time_zone 'Poland'
    end
  end
end