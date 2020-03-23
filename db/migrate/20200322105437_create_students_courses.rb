class CreateStudentsCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :students_courses do |t|
      t.belongs_to :student
      t.belongs_to :subject
      t.belongs_to :teacher
    end
  end
end
