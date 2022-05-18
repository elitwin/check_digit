# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'check_digit/version'

Gem::Specification.new do |spec|
  spec.name          = "check_digit"
  spec.version       = CheckDigit::VERSION
  spec.authors       = ["Eric Litwin"]
  spec.email         = ["eric.litwin@pnmac.com"]
  spec.summary       = %q{Check Digit calculator/validator}
  spec.description   = %q{Ruby implementation of Luhn, Damm and Verhoeff check digit algorithms}
  spec.homepage      = "http://github.com/elitwin/check_digit"
  spec.licenses      = ["MIT"]

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.platform      = Gem::Platform::RUBY

  spec.add_development_dependency "bundler", ">= 2.2.33"
  spec.add_development_dependency "rspec", "~> 3.1"
end
