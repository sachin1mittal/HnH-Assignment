RSpec.describe Subject, type: :model do
  context 'Validations' do
    it 'is not valid without a name' do
      subject = Subject.new
      expect(subject).to_not be_valid
    end

    it 'is not valid without a unique name' do
      subject = FactoryBot.create(:subject)
      new_subject = Subject.new(name: subject.name)
      expect(new_subject).to_not be_valid
    end
  end

  describe 'associations' do
    let(:subject) { FactoryBot.create(:subject) }
    let(:teacher1) { FactoryBot.create(:teacher) }

    it 'can be opted by any teacher' do
      expect(subject.teachers).to be_empty
      subject.teachers << teacher1
      expect(subject.teachers).to contain_exactly(teacher1)
    end
  end
end
