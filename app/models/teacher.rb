class Teacher < ApplicationRecord
  has_many :students_courses
  has_many :students, through: :students_courses
  has_many :course_subjects, through: :students_courses, source: :subject
  has_and_belongs_to_many :subjects

  validates_presence_of :name, :education

  enum education: {
    bachelors: 'bachelors',
    masters: 'masters'
  }
end
