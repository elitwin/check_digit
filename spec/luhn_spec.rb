require 'spec_helper'

module CheckDigit
  describe Luhn do
    it "generates checksum values" do
      val = (1..23).inject(1) { |val, i| Luhn.checksum val }
      expect(val).to eq(182675918342675918342675)

      expect(Luhn.checksum(100913449)).to eq(1009134493)
      expect(Luhn.checksum(123)).to eq(1230)
    end

    it "generates a checkum value for an integer string" do
      expect(Luhn.checksum("123")).to eq(1230)
    end

    it "raises an error for a non-integer string" do
      expect {Luhn.checksum("A123")}.
        to raise_error(ArgumentError, 'invalid argument')

      expect {Luhn.valid?("A123")}.
        to raise_error(ArgumentError, 'invalid argument')
    end

    it "raises an error for a non-integer numeric" do
      expect {Luhn.checksum("123.45")}.
        to raise_error(ArgumentError, 'invalid argument')

      expect {Luhn.valid?("123.45")}.
        to raise_error(ArgumentError, 'invalid argument')
    end

    it "tests an existing number for a valid checksum" do
      expect(Luhn.valid?(9993)).to be true
      expect(Luhn.valid?(9999)).to be false
    end
  end
end
