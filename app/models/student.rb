class Student < ApplicationRecord
  has_many :students_courses
  has_many :subjects, through: :students_courses
  has_many :teachers, through: :students_courses

  validates_presence_of :name, :roll_number, :house
  validates_uniqueness_of :roll_number

  enum house: {
    green: 'green',
    red: 'red',
    blue: 'blue',
    yellow: 'yellow'
  }

  def courses
    students_courses.includes(:teacher, :subject)
                    .inject({}) do |res, course|
      res[course.subject.name] = course.teacher.name
      res
    end
  end
end
