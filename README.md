# Currency

Don't mind me, I'm just for tests ;)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'currency'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install currency

## Usage

Before start using, configure it like below:

```ruby
Currency.conversion_rates('EUR', 'USD' => 1.11, 'Bitcoin' => 0.0047)
```

With the configuration done, you can start manipulate values as follows:


```ruby
fifty_eur = Currency::Money.new(50, 'EUR')
fifty_eur.amount   # => 50
fifty_eur.currency # => "EUR"
fifty_eur.inspect  # => "50.00 EUR"
```

To convert to another currency (that was previously configured) use the method
`convert_to`

```ruby
fifty_eur.convert_to('USD') # => 55.50 USD
```

Note that `convert_to` will return a new `Money` object


### Performing operations

You can perform simple calculations even with different currencies:

```ruby
fifty_eur = Currency::Money.new(50, 'EUR')
fifty_eur + Currency::Money.new(20, 'USD') # => 68.02 EUR
fifty_eur - Currency::Money.new(20, 'USD') # => 31.98 EUR
fifty_eur / 2                              # => 25 EUR
Currency::Money.new(20, 'USD') * 3         # => 60 USD
```


### Comparison

`Money` can be compared to other `Money` object with simple operators

```ruby
one = Currency::Money.new(50, 'EUR')
other = Currency::Money.new(55.50, 'USD')

one == other # => true

twenty_eur = Currency::Money.new(20, 'EUR')
twenty_usd = Currency::Money.new(20, 'USD')

twenty_eur > twenty_usd # => true
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/luizkowalski/currency.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
