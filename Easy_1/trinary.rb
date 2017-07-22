class Trinary
  attr_accessor :num_string

  def initialize(num_string)
    @num_string = num_string
  end

  def to_decimal
    return 0 if num_string.match(/\D/)
    converted_digits = []
    ints = num_string.chars.reverse!.map!(&:to_i)
    ints.each_with_index do |value, index|
                          converted_digits.push(value * (3 ** index))
                        end
    converted_digits.reduce(:+)
  end


 


end


tri = Trinary.new('102012')
p tri.to_decimal

# # "102012"
#     1       0       2       0       1       2    # the number
# 1*3^5 + 0*3^4 + 2*3^3 + 0*3^2 + 1*3^1 + 2*3^0    # the value
#   243 +     0 +    54 +     0 +     3 +     2 =  302