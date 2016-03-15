require 'spec_helper'

describe 'SQLite handling for float date and time' do

  before(:all) do
    GBDateConnection.sqlite
    CreateFooTable.migrate(:up)
  end

  context 'time' do
    it 'should save time from date string' do
      foo = Foo.create! foo_time: '01:06:41'
      expect(foo.foo_time).to eq Time.parse('2000-01-01 01:06:41 +0000')
    end

    it 'should save time from float' do
      foo = Foo.create! foo_time: 17021201.0
      expect(foo.foo_time).to eq Time.parse('2000-01-01 00:06:41 +0000')
    end

    it 'should save time from float string' do
      foo = Foo.create! foo_time: '17021201.0'
      expect(foo.foo_time).to eq Time.parse('2000-01-01 00:06:41 +0000')
    end
  end

  context 'datetime' do
    it 'should save time from date string' do
      foo = Foo.create! foo_datetime: '1970-07-17 01:06:41 +0100'
      expect(foo.foo_datetime).to eq Time.at(17021201)
    end

    it 'should save time from float' do
      foo = Foo.create! foo_datetime: 17021201.0
      expect(foo.foo_datetime).to eq Time.at(17021201)
    end

    it 'should save time from float string' do
      foo = Foo.create! foo_datetime: '17021201.0'
      expect(foo.foo_datetime).to eq Time.at(17021201)
    end
  end

  context 'date' do
    it 'should save time from date string' do
      foo = Foo.create! foo_date: '1970-01-02'
      expect(foo.foo_date).to eq Date.new(1970,1,2)
    end

    it 'should save time from float' do
      foo = Foo.create! foo_date: 170000.0
      expect(foo.foo_date).to eq Date.new(1970,1,2)
    end

    it 'should save time from float string' do
      foo = Foo.create! foo_date: '170000.0'
      expect(foo.foo_date).to eq Date.new(1970,1,2)
    end
  end
end