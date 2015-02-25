module CheckDigit::Luhn
  def self.checksum(num)
    CheckDigit::Util.valid_arg(num)
    num.to_i * 10 + calc(num)
  end

  def self.valid?(num)
    CheckDigit::Util.valid_arg(num)
    calc(num.to_s[0..-2]) == num % 10
  end

  private
  def self.calc(num)
    digits = num.to_s.reverse.scan(/\d/).map { |x| x.to_i }
    digits = digits.each_with_index.map { |d, i|
      d *= 2 if i.even?
      d > 9 ? d - 9 : d
    }
    sum = digits.inject(0) { |m, x| m + x }
    mod = 10 - sum % 10
    mod==10 ? 0 : mod
  end
end
