
class Series
  attr_accessor :string
  def initialize(string)
    @string = string
  end

  def slices(num_of_slices)
    fail ArgumentError.new("Too Long") if num_of_slices > @string.length
    the_series = []
    start = 0
    ints = @string.chars.map do |el|
                              el.to_i
                            end
    loop do 
      the_series.push(ints[start, num_of_slices])
      start += 1
      break if start >= ints.count
    end
    the_series.select! do |element|
                element.size == num_of_slices
            end
    the_series
  end

end


