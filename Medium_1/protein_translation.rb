class InvalidCodonError < StandardError
end

class Translation
  PROTIENS = {
    'Methionine' => ['AUG'],
    'Phenylalanine' => ['UUU', 'UUC'],
    'Leucine' => ['UUA', 'UUG'],
    'Serine' => ['UCU', 'UCC', 'UCA', 'UCG'],
    'Tyrosine' => ['UAU', 'UAC'],
    'Cysteine' => ['UGU', 'UGC'],
    'Tryptophan' => ['UGG'],
    'STOP' => ['UAA', 'UAG', 'UGA']
  }

  def self.of_codon(original)
    PROTIENS.each_pair do |protien, array|
                  return protien if array.include?(original)
                end

  end

  def self.of_rna(strand)
    if strand.match(/[^AUGC]/) != nil
      raise InvalidCodonError
    end
    
    peptides = []
    start = 0
    term = start
    
    loop do 
      peptides.push(strand[start, term + 3])
      start += 3
      break if start == strand.length
    end
    
    protien_string = []
    index = 0
    
    loop do 
      PROTIENS.each do |protien|
                    protien_string.push(protien[0]) if protien[1].include?(peptides[index])
                  end
      index += 1
      break if index >= peptides.size
    end
    
    protien_string = check_for_stop(protien_string)
    protien_string
  end

  def self.check_for_stop(array)
    if array.include?('STOP')
      array[0, array.index('STOP')]
    else
      array
    end
  end





end

thing = Translation.of_rna('AUGUUUUGG')




