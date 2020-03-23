class CreateSubjectsTeachers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :subjects, :teachers
  end
end
