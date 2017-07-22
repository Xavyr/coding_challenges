class DNA


  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other)
    total = 0
    @strand[0..other.size - 1].chars.each_with_index do |val, index|
                                                      total += 1 if val != other[index]
                                                    end
    total
  end


end

test = DNA.new('GACTACGGACAGGGTAGGGAAT').hamming_distance('GACATCGCACACC')