class Phrase

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    conduct = @phrase
    if conduct.match(/[^a-zA-Z]/)
      conduct = clean(conduct)
    end
    cleaned = conduct.split(' ').map do |word|
                        remove_quotes(word)
                      end
    p add_to_hash(cleaned)
  end

  def clean(phrase)
    newl = phrase.chars.map! do |letter|
                  if letter.match(/[^a-zA-Z1-9']/)
                      letter = ' '
                  else
                    letter.downcase
                  end
                end.join()
    newl
  end

  def add_to_hash(arr)
    hash = {}
    arr.each do |word|
        if hash.include?(word)
          hash[word] += 1
        else
          hash[word] = 1
        end
      end
    return hash
  end

  def remove_quotes(word)
    if word[0].match(/[^a-zA-Z1-9]/)
      word = word[1..-1]
    end
    if word[-1].match(/[^a-zA-Z1-9]/)
      word = word[0..-2]
    end
    return word
  end

end

p = Phrase.new("Joe can't tell between 'large' and large.")
p.word_count