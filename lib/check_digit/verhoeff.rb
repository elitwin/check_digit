module CheckDigit::Verhoeff
  D = [
       [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
       [1, 2, 3, 4, 0, 6, 7, 8, 9, 5],
       [2, 3, 4, 0, 1, 7, 8, 9, 5, 6],
       [3, 4, 0, 1, 2, 8, 9, 5, 6, 7],
       [4, 0, 1, 2, 3, 9, 5, 6, 7, 8],
       [5, 9, 8, 7, 6, 0, 4, 3, 2, 1],
       [6, 5, 9, 8, 7, 1, 0, 4, 3, 2],
       [7, 6, 5, 9, 8, 2, 1, 0, 4, 3],
       [8, 7, 6, 5, 9, 3, 2, 1, 0, 4],
       [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
      ].freeze

  P = [
       [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
       [1, 5, 7, 6, 2, 8, 3, 0, 9, 4],
       [5, 8, 0, 3, 7, 9, 6, 1, 4, 2],
       [8, 9, 1, 6, 0, 4, 3, 5, 2, 7],
       [9, 4, 5, 3, 1, 2, 6, 8, 7, 0],
       [4, 2, 8, 6, 5, 7, 3, 9, 0, 1],
       [2, 7, 9, 3, 8, 0, 6, 4, 1, 5],
       [7, 0, 4, 6, 9, 1, 3, 2, 5, 8]
      ].freeze

  INV = [0, 4, 3, 2, 1, 5, 6, 7, 8, 9].freeze

  ZERO_ORDINAL = 48 # '0'.each_byte.first on 1.8 or '0'.ord on 1.9

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
    INV[num.to_s.each_byte.reverse_each.with_index.inject(0) { |check,(x,i)|
          D[check][P[i.next % 8][x - ZERO_ORDINAL]]
        }]
  end
end
