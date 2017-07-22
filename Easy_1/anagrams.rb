class Anagram
  attr_accessor :word

  def initialize(word)
    @word = word
  end

  def match(possibilities)
    possibilities.map! do |word|
              word.chars
            end

    possibilities.select! do |possible|
                cleaned_possibility = possible.join('').downcase
                cleaned_original_word = @word.downcase
                cleaned_possibility.chars.sort == cleaned_original_word.chars.sort
            end.map! {|accepted| accepted.join('') }

    possibilities.select! do |possible|
                  possible.downcase != word.downcase
                end

    possibilities
  end


end

detector = Anagram.new('corn')
detector.match(%w(corn dark Corn rank CORN cron park))