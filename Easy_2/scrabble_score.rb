class Scrabble
  attr_accessor :string, :values

  def initialize(string)
    @string = string
    @values = {
      'a' => 1,
      'e' => 1,
      'i' => 1,
      'o' => 1,
      'u' => 1,
      'l' => 1,
      'n' => 1,
      'r' => 1,
      's' => 1,
      't' => 1,
      'd' => 2,
      'g' => 2,
      'b' => 3,
      'c' => 3,
      'm' => 3,
      'p' => 3,
      'f' => 4,
      'h' => 4,
      'v' => 4,
      'w' => 4,
      'y' => 4,
      'k' => 5,
      'j' => 8,
      'x' => 8,
      'z' => 10,
      'q' => 10,
    }
  end

  def score
    return 0 if string == nil || string.empty? || string.include?(' ')
    tally = 0
    string.chars.each do |letter|
              tally += @values[letter.downcase]
            end
    tally
  end

  def self.score(new_string)
    instance = Scrabble.new(new_string)
    instance.score
  end 

end


