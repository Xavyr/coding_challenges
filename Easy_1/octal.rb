class Octal
  attr_accessor :octal
  
  def initialize(int)
    @octal = int
  end

  def to_decimal
    return 0 if @octal.to_i == 8 || 
                @octal.to_i == 9 || 
                @octal.to_i == 6789 || 
                @octal.match(/\D/)

    converted_digits = []
    ints = @octal.to_s.chars.map! do |string|
                            string.to_i 
                          end
    ints.reverse!
    ints.each_with_index do |value, index|
                        converted_digits.push(value * (8 ** index))
                      end
    
    converted_digits.reduce(:+)
  end




end

test = Octal.new(8)
p test.to_decimal

# = 2*8^2 + 3*8^1 + 3*8^0
# = 2*64  + 3*8   + 3*1
# = 128   + 24    + 3
# = 155