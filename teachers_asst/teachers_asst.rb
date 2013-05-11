require 'csv'

class Grades
  attr_accessor :grades

  def initialize(grades)
    @grades = grades
  end

  def sum
    sum = 0
    self.grades.each do |num|
      sum += num
    end
    return sum
  end

  def avg
    self.sum / self.grades.length
  end

  def lettergrade(avg=self.avg)
    if avg > 89.9
      letter = 'A'
    elsif avg <= 89.9 && avg > 79.9
      letter = 'B'
    elsif avg <= 79.9 && avg > 69.9
      letter = 'C'
    elsif avg <= 69.9 && avg > 59.9
      letter = 'D'
    else
      letter = 'F'
    end
  end
end

class StudentList
  attr_accessor :students, :scores, :avg_score, :min_score, :max_score, :variance, :standard_dev

  def initialize(students)
    @students = students
    make_student_list_objects
    @scores = scores
    @avg_score = avg_score
    @min_score = min_score
    @max_score = max_score
    @variance = variance
    @standard_dev = standard_dev
  end

  def make_student_list_objects
    self.students.each do |student, grades|
      g = Grades.new(grades)
      self.students[student] = g
    end
    puts self.students
  end

  def scores
    scores = []
    students.each do |student, grade|
      scores.push(grade.avg)
    end
    return scores
  end

  def avg_score
    avg_score = 0
    scores.each do |score|
      avg_score += score.to_i
    end
    avg_score = avg_score / scores.length
    return avg_score
  end

  def min_score
    return scores.sort.first
  end

  def max_score
    return scores.sort.last
  end

  def variance
    difference = []
    scores.each do |score|
      d = score - avg_score
      difference.push(d)
    end
    squares = []
    difference.each do |d|
      square = d * d
      squares.push(square)
    end
    total = 0
    squares.each do |square|
      total += square
    end
    variance = total / squares.length
    return variance
  end

  def standard_dev
    standard_dev = Math.sqrt(variance)
  end

end

def get_file
  begin
    puts "What is the name of the file where grades are stored? (students.csv)"
    f = gets.chomp
    if !f.include?(".csv")
      puts "The file must be a .csv; Please try again including the name of a .csv file."
      get_file
    end
    x = File.read(File.join(File.dirname(__FILE__), "#{f}"))
    return x
  rescue
    puts 'File not found. Please try again'
    get_file
  end
end

x = get_file

# Convert grades to a hash
students = {}
CSV.parse(x).each do |row|
  sp = row[0].index(' ')
  first = row[0][0..sp-1]
  last = row[0][sp+1..-1]
  row[0] = "#{last}, #{first}"
  x = row[0]
  row.shift
  students[x] = row
end

# List grades for each student as an array of floats
students.each do |key, array|
  array.each do |value|
    x = value.to_f
    array.shift
    array.push(x)
  end
end

student_list = StudentList.new(students)

File.open('class_scores.txt', 'w') do |f|
  student_list.students.sort.each do |student, grade|
    f.puts "#{student}: #{grade.avg}, #{grade.lettergrade}"
  end
  f.puts
  f.puts "The class average was #{student_list.avg_score}."
  f.puts "The minimum score was #{student_list.min_score}."
  f.puts "The maximum score was #{student_list.max_score}."
  f.puts "The standard deviation was #{student_list.standard_dev}."
end
