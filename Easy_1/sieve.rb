

class Sieve
  attr_accessor "limit"

  def initialize(limit)
    @limit = limit
  end

  def primes
    all_nums = {}
    num = 2
    increasing = num
    2.upto(@limit) do |iteration|
              all_nums[iteration] = 'unmarked'
            end
    
    while all_nums.has_value?('unmarked')
      all_nums[num] = 'prime'
      increasing += num
      while increasing <= @limit
        if all_nums[increasing] == 'unmarked'
          all_nums[increasing] = 'composite'
        end
        increasing += num
      end
      num = all_nums.key('unmarked')
      increasing = num
    end

    final = all_nums.select! do |key, value|
                      value == 'prime'
                    end.keys
    final

  end



end

s = Sieve.new(10)
s.primes