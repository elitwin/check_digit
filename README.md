# CheckDigit

Ruby implementation of the Luhn, Damm and Verhoeff check digit algorithms

## Installation

Add this line to your application's Gemfile:

    gem 'check_digit'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install check_digit

## Usage

Each implementation provides the same 2 class methods:
* checksum(num) - returns a new number with the checksum digit appended at the end
* valid?(num) - returns true if the number has a valid checksum digit, false if the number has an invalid checksum digit

Code sample:
    require 'check_digit'

    Damm.checksum(123) # returns 1234
    Damm.valid?(1234) # returns true
    Damm.valid?(1239) # returns false

## Contributing

1. Fork it ( https://github.com/elitwin/check_digit/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Attributions
The Verhoeff implementation was provided from this repo(https://github.com/bai/verhoeff) and was the inspiration for the interface (checksum, valid?)used by all the implementations