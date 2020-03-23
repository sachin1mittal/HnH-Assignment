RSpec.describe Student, type: :model do
  context 'Validations' do
    it 'is not valid without a name, roll_number or house' do
      student = Student.new
      expect(student).to_not be_valid
    end

    it 'is not valid without a name' do
      student = Student.new(house: :red, roll_number: '100')
      expect(student).to_not be_valid
    end

    it 'is not valid without a roll_number' do
      student = Student.new(house: :red, name: 'Sachin')
      expect(student).to_not be_valid
    end

    it 'is not valid without a house' do
      student = Student.new(roll_number: '100', name: 'Sachin')
      expect(student).to_not be_valid
    end

    it 'is not valid without given houses' do
      expect {
        Student.new(roll_number: '100', name: 'Sachin', house: :random)
      }.to raise_error(ArgumentError)
    end

    it 'is not valid without a unique roll_number' do
      student = FactoryBot.create(:student)
      new_student = Student.new(house: :green, name: 'Sachin1', roll_number: student.roll_number)
      expect(new_student).to_not be_valid
    end
  end

  describe 'associations' do
    let(:student) { FactoryBot.create(:student) }
    let(:teacher1) { FactoryBot.create(:teacher) }
    let(:teacher2) { FactoryBot.create(:teacher) }
    let(:subject1) { FactoryBot.create(:subject) }
    let(:subject2) { FactoryBot.create(:subject) }

    before do
      teacher1.subjects = [subject1]
    end

    it 'cannot opt for subject which have no teachers' do
      expect {
        student.students_courses.create!(subject: subject2, teacher: teacher2)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'cannot opt for subject with teacher who dont teach this subject' do
      expect {
        student.students_courses.create!(subject: subject1, teacher: teacher2)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'cannot opt for subject with teacher who dont teach the opted subject' do
      expect {
        student.students_courses.create!(subject: subject1, teacher: teacher2)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'can opt for subject with teacher who teach the opted subject' do
      expect(student.teachers).to be_empty
      expect(student.subjects).to be_empty
      student.students_courses.create!(subject: subject1, teacher: teacher1)
      expect(student.teachers).to contain_exactly(teacher1)
      expect(student.subjects).to contain_exactly(subject1)
    end
  end

  describe '#courses' do
    let(:student) { FactoryBot.create(:student) }
    let(:teacher1) { FactoryBot.create(:teacher) }
    let(:subject1) { FactoryBot.create(:subject) }

    before do
      teacher1.subjects = [subject1]
      student.students_courses.create!(subject: subject1, teacher: teacher1)
    end

    it 'should return opted courses with subject and teacher name' do
      expect(student.courses).to eq({ subject1.name => teacher1.name })
    end
  end
end
