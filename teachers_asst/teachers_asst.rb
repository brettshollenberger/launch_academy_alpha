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
  attr_accessor :students

  def initialize(students)
    @students = students
    make_student_list_objects
  end

  def make_student_list_objects
    self.students.each do |student, grades|
      g = Grades.new(grades)
      self.students[student] = g
    end
    puts self.students
  end
  # @students.length.times do |student|
  #   x = Grades.new(student)
  #   grades.push(student)
  # end
end

students = {
  Kyle: [50, 40, 70],
  Tom: [100, 95, 95],
  Abby: [70, 95, 100]
}

student_list = StudentList.new(students)

student_list.students.each do |student, grade|
  puts "#{student} got #{grade.avg}, an #{grade.lettergrade}"
end
