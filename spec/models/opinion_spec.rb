require 'rails_helper'

RSpec.describe Opinion, type: :model do
  context 'ActiveModel Validations' do
    subject do
      described_class.new(
        Text: 'Hello',
        author: User.new
      )
    end

    it 'is valid with valid attirbutes' do
      expect(subject).to be_valid
    end

    it 'is not valid without Text' do
      subject.Text = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with text less than 2 character' do
      subject.Text = 'h'
      expect(subject).to_not be_valid
    end
  end

  context 'ActiveRecord Associations' do
    it { expect(described_class.reflect_on_association(:author).macro).to eq(:belongs_to) }
    it { expect(described_class.reflect_on_association(:likes).macro).to eq(:has_many) }
  end
end
