class StudentsCourse < ApplicationRecord
  belongs_to :student
  belongs_to :subject
  belongs_to :teacher

  validate :teacher_teaches_subject, if: :teacher
  validates_uniqueness_of :student_id, scope: :subject_id

  private

  def teacher_teaches_subject
    if !teacher.subject_ids.include?(subject_id)
      self.errors.add(:base, 'Teacher is not available for this subject')
    end
  end
end
