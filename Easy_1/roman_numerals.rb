class Fixnum

  def to_roman
    number = self
    indexes = {
      1 => "I",
      5 => "V",
      10 => "X",
      50 => "L",
      100 => "C",
      500 => "D",
      1000 => "M",
    }

    others = {
      '4' => 'IV'
      '90' => 'XC'
    }

    values = [1000, 500, 100, 50, 10, 5, 1]
    array = []

    
    loop do 
      if number - values.max < 0
        values.shift
      else
        array.push(values.max)
        number -= values.max
      end
      break if number == 0
    end
    total = 0
    answer = []
    array.each_with_index do |val, index|
            total += val
            if total == 4



end





end

93.to_roman


#p '14Pk4sTdcuHoeXceKek4ZWRNgkDvzqwbfP' == '14Pk4sTdcuHoeXceKek4ZWRNgkDvzqwbfP'