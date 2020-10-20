require 'rails_helper'

RSpec.describe Like, type: :model do

  before :each do
    @user = User.create(id: 1, username: 'jason', fullname: 'Okikiola Smith', photo: nil, coverimage: nil)
    @opinion = Opinion.create(id: 1, author_id: @user.id, Text: "eeeeeeeeeeeeeeeeee")
  end

  context 'Like Validations' do
    it 'accepts valid attributes' do
      expect(@opinion).to be_valid
    end

    it 'accepts a text' do
      expect(@opinion.Text).to be_present
    end
  end

  context 'ActiveRecord Associations' do
    it { expect(described_class.reflect_on_association(:opinion).macro).to eq(:belongs_to) }
    it { expect(described_class.reflect_on_association(:user).macro).to eq(:belongs_to) }
  end
  
end