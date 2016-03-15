# GBDate

GBDate is a gem extending rails to accept dates as float or numeric. 
It means that http client can send date or time in format of `1732131232.236732` instead of a date string.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gb_date'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install gb_date

## Usage

Basic usage is out of a box inserted into rails.
On top of that you get few extensions.

```ruby
 object = MyModel.create date_field: '1458068508.965463'
 puts object.date_field
```
Will result with `2016-03-15 19:01:48 UTC`

### Api

For api use, default time are extended with following methods:
 
```ruby
 Time.now.to_api_decimal
```
Returns `BigDecimal` with precision to microseconds

```ruby
 Time.now.to_api_f
```
Returns `Float` with precision to microseconds

```ruby
 Time.now.to_api_s
```
Returns `String` representation of decimal number with precision to microseconds

### Numeric

You can convert numbers to Time

```ruby
    1234343.to_time
    1234343.232.to_time
```
with time zone

```ruby
    1234343.in_time_zone(zone)
```
or Date

```ruby
    1234343.to_date
```

or DateTime

```ruby
    1234343.to_datetime
```

### Date

Convert to beginning of date in utc time

```ruby
    Date.today.to_utc_time
```

### Time

Convert to DateTime

```ruby
    Time.now.to_datetime
```

Convert to BigDecimal 

```ruby
    Time.now.to_decimal
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/gb_date.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

