require 'spec_helper'

module CheckDigit
  describe Damm do
    it "generates checksum values" do
      expect(Damm.checksum(100913449)).to eq(1009134493)
      expect(Damm.checksum(123)).to eq(1234)
    end

    it "generates a checkum value for an integer string" do
      expect(Damm.checksum("123")).to eq(1234)
    end

    it "raises an error for a non-integer string" do
      expect {Damm.checksum("A123")}.
        to raise_error(ArgumentError, 'invalid argument')

      expect {Damm.valid?("A123")}.
        to raise_error(ArgumentError, 'invalid argument')
    end

    it "raises an error for a non-integer numeric" do
      expect {Damm.checksum("123.45")}.
        to raise_error(ArgumentError, 'invalid argument')

      expect {Damm.valid?("123.45")}.
        to raise_error(ArgumentError, 'invalid argument')
    end

    it "tests an existing number for a valid checksum" do
      expect(Damm.valid?(9990)).to be true
      expect(Damm.valid?(9999)).to be false
    end

    it "benchmarks performance (#{BMITERS} iterations)" do
      puts '  ' + '-' * 55
      Benchmark.bm(10) do |x|
        x.report("  generate:") {
          i = BMITERS
          while i > 1
            Damm.checksum(i)
            i-=1
          end
        }

        x.report("  validate:") {
          i = BMITERS
          while i > 1
            Damm.valid?(i)
            i-=1
          end
        }
      end
      puts '  ' + '-' * 55
    end
  end
end
