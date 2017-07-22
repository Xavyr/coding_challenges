class PhoneNumber

  def initialize(number)
    @number = number
  end

  def number
    cleaned_number = @number.gsub(/[^0-9]/, '')
    return '0000000000' if @number.match(/[a-zA-Z]/)
    return cleaned_number[1..10] if cleaned_number.size == 11 && cleaned_number[0] == 1.to_s
    return '0000000000' if cleaned_number.size != 10 
    cleaned_number
  end

  def area_code
    area_code = number[0..2]
    area_code
  end

  def to_s
    string = '(' + number[0..2] + ') ' + number[3..5] + '-' + number[6..-1]
    p string
  end

end

n = PhoneNumber.new('1a2a3a4a5a6a7a8a9a0a')
n.to_s