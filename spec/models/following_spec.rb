require 'rails_helper'

RSpec.describe Following, type: :model do
  context 'ActiveRecord Validations' do
    before :each do
      @follower = User.create(id: 1, username: 'jason', fullname: 'Okikiola Smith', photo: nil, coverimage: nil)
      @followed = User.create(id: 2, username: 'kikiolla', fullname: 'Okikiola Smith', photo: nil, coverimage: nil)
      @following = Following.create(follower_id: @follower.id, followed_id: @followed.id)
    end

    it 'is not valid without valid following' do
      expect(@following).to be_valid
    end
  end

  context 'ActiveRecord Associations' do
    it { expect(described_class.reflect_on_association(:follower).macro).to eq(:belongs_to) }
    it { expect(described_class.reflect_on_association(:followed).macro).to eq(:belongs_to) }
  end
end
