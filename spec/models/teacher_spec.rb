RSpec.describe Teacher, type: :model do
  context 'Validations' do
    it 'is not valid without a name or education' do
      teacher = Teacher.new
      expect(teacher).to_not be_valid
    end

    it 'is not valid without a name' do
      teacher = Teacher.new(education: :masters)
      expect(teacher).to_not be_valid
    end

    it 'is not valid without education' do
      teacher = Teacher.new(name: 'Sachin')
      expect(teacher).to_not be_valid
    end

    it 'is not valid without given education' do
      expect {
        Teacher.new(name: 'Sachin', education: :random)
      }.to raise_error(ArgumentError)
    end
  end

  describe 'associations' do
    let(:teacher) { FactoryBot.create(:teacher) }
    let(:subject1) { FactoryBot.create(:subject) }

    it 'can opt for any subject' do
      expect(teacher.subjects).to be_empty
      teacher.subjects << subject1
      expect(teacher.subjects).to contain_exactly(subject1)
    end
  end
end
