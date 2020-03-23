class Subject < ApplicationRecord
  has_many :students_courses
  has_many :students, through: :students_courses
  has_many :course_teachers, through: :students_courses, source: :teacher
  has_and_belongs_to_many :teachers

  validates_presence_of :name
  validates_uniqueness_of :name
end
