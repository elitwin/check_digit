require 'check_digit'
require 'benchmark'

# of iterations to benchmark
BMITERS = 500_000

RSpec.configure do |config|
  config.order = "random"
end
