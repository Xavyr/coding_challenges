class School
  attr_accessor :students, :hash

  def initialize
    @students = []
    @hash = self.to_h
  end

  def to_h
    raw = {}
    students.each do |person|
                  name = person[1]
                  grade = person[0]
                  if raw.include?(grade)
                    raw[grade] = raw[grade].push(name)
                  else
                    raw[grade] = [name]
                  end
                end

    @hash = sort(raw)
    @hash
  end

  def sort(unsorted_hash)
    sorted_students = unsorted_hash.sort_by { |key, v| key }
    sorted_hash = sorted_students.each do |name|
                          name[1].sort!
                        end.to_h
    sorted_hash
  end

  def add(name, grade)
    students.push([grade, name])
    self.to_h
  end 

  def grade(number)
    number_grade = @hash.select do |grade_set|
                 grade_set == number
              end
    return [] if number_grade[number] == nil
    number_grade[number]
  end


end


school = School.new
[
      ['Jennifer', 4], ['Kareem', 6],
      ['Christopher', 4], ['Kyle', 3]
    ].each do |name, grade|
      school.add(name, grade)
    end
p school.to_h










