class Sum_Of_Multiples

  def initialize(*args)

  end

  #this is for the Sum_Of_Multiples.to(int)
  def self.to(int)
    final_arr = []
    set = [3,5]
    1.upto(int - 1) do |num|
                set.each do |factor|
                    final_arr.push(num) if num % factor == 0
                end
            end
    final_arr.reduce(:+)
  end

  #this is on the instance of this class
  def to(int)
    p self.class.to
  end

end



p Sum_Of_Multiples.to(10)
# Sum_Of_Multiples.new(555).to(4)