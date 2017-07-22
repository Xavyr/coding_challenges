require 'prime'

class PerfectNumber

  def self.classify(number)
    raise "RuntimeError" if number < 0
    return 'deficient' if number.prime?

    divisors = []

    1.upto(number - 1) do |potential|
                  if number % potential == 0
                    divisors.push(potential)
                  end
                end

    if divisors.reduce(:+) == number
      return "perfect"
    elsif divisors.reduce(:+) > number
      return "abundant"
    else
      return "deficient"
    end
  end

end
