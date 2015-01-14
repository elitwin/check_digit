module CheckDigit::Damm
  D = [
       [0, 3, 1, 7, 5, 9, 8, 6, 4, 2],
       [7, 0, 9, 2, 1, 5, 4, 8, 6, 3],
       [4, 2, 0, 6, 8, 7, 1, 3, 5, 9],
       [1, 7, 5, 0, 9, 8, 3, 4, 2, 6],
       [6, 1, 2, 3, 0, 4, 5, 9, 7, 8],
       [3, 6, 7, 4, 2, 0, 9, 5, 8, 1],
       [5, 8, 6, 9, 7, 2, 0, 1, 3, 4],
       [8, 9, 4, 5, 3, 6, 2, 0, 1, 7],
       [9, 4, 3, 8, 6, 1, 7, 2, 0, 5],
       [2, 5, 8, 1, 4, 3, 6, 7, 9, 0]
      ]

  def self.checksum(num)
    CheckDigit::Util.valid_arg(num)
    num.to_i * 10 + checksum_digit(num)
  end

  def self.valid?(num)
    CheckDigit::Util.valid_arg(num)
    checksum_digit(num.to_s[0..-2]) == num % 10
  end

  private
  def self.checksum_digit(num)
    num.to_s.each_char.inject(0) {|m,v|
      D[m][v.to_i].to_i
    }
  end
end
