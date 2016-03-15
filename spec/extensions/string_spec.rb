require 'spec_helper'

describe String do

  it 'should respond to_time' do
    expect('17021201.0'.to_time).to eq Time.at(17021201)
    expect('1970-07-17 01:06:41 +0100'.to_time).to eq Time.at(17021201)
  end

  it 'should respond in_time_zone' do
    expect('17021201.0'.in_time_zone 'Poland').to eq Time.at(17021201).in_time_zone 'Poland'
    expect('1970-07-17 01:06:41 +0100'.in_time_zone 'Alaska').to eq Time.at(17021201).in_time_zone 'Alaska'
  end
end