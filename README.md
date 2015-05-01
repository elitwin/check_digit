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

## Algorithm Comparison - Error Prevention
| Error Type                                 | % of All Errors | Luhn | Damm | Verhoeff |
|:-----------------------------------------  |:--------------- |:----:|:----:|:--------:|
| single errors: a becomes b                 | 60% to 95%      |  1   |  1   |     1    |
| omitting or adding a digit                 | 10% to 20%      |  1   |  1   |     1    |
| adjacent transpositions: *ab* becomes *ba* | 10% to 20%      |  2   |  1   |     1    |
| twin errors: *aa* becomes *bb*             | 0.5% to 1.5%    |  3   |  1   |     2    |
| jump transpositions: *acb* becomes *bca*   | 0.5% to 1.5%    |  2   |  1   |     2    |
| jump twin errors: *aca* becomes *bcb*      | below 1%        |  1   |  1   |     2    |
| phonetic errors: *a0* becomes *0a*         | 0.5% to 1.5%    |  1*  |  1   |     2    |

Source: http://www.augustana.ab.ca/~mohrj/algorithms/checkdigit.html

\* Not entirely sure if Luhn catches all phonetic errors, e.g. 13 instead of 30

#####*Legend*
1. Prevents all errors
2. Prevents most errors
3. Prevents some errors
4. Does not prevent any errors

## Algorithm Comparison - Performance
#####50,000 iterations (time in seconds)*

| Algorithm | Generate | Validate |
|:--------- | --------:| --------:|
| Luhn      | 6.630000 | 6.390000 |
| Damm      | 1.700000 | 1.610000 |
| Verhoeff  | 3.730000 | 3.720000 |

\* Test was on Linux 14.04 with 2.80GHz Intel Xeon E5-1603 - relative timing is more important to consider when comparing performance

## Contributing

1. Fork it ( https://github.com/elitwin/check_digit/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Attributions
The Verhoeff implementation was provided from this repo (https://github.com/bai/verhoeff) and was the inspiration for the interface (checksum, valid?) used by all the implementations