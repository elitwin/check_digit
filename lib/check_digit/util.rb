module CheckDigit::Util
  def self.valid_arg(num)
    raise ArgumentError, 'invalid argument' unless
      num.is_a?(Integer) || (num.to_i.to_s == num)
  end
end
