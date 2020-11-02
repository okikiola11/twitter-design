require 'rails_helper'

RSpec.describe User, type: :model do
  context 'ActiveModel Validations' do
    subject do
      described_class.new(
        username: 'kikiolla',
        fullname: 'John Doe'
      )
    end
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'is not valid without username' do
      subject.username = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without fullname' do
      subject.fullname = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with username less than 3 characters' do
      subject.username = 'ok'
      expect(subject).to_not be_valid
    end

    it 'is not valid with fullname less than 3 characters' do
      subject.fullname = 'ok'
      expect(subject).to_not be_valid
    end
  end

  context 'ActiveRecord Associations' do
    it { expect(described_class.reflect_on_association(:opinions).macro).to eq(:has_many) }
    it { expect(described_class.reflect_on_association(:active_followings).macro).to eq(:has_many) }
    it { expect(described_class.reflect_on_association(:following).macro).to eq(:has_many) }
    it { expect(described_class.reflect_on_association(:passive_followings).macro).to eq(:has_many) }
    it { expect(described_class.reflect_on_association(:followers).macro).to eq(:has_many) }
  end
end
