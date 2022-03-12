require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures first name presence' do
      user = User.new(last_name: 'Last', email: 'sample@exmaple.com').save
      expect(user).to eq(false)
    end

    it 'ensures last name presence' do
      user = User.new(first_name: 'First', email: 'sample@exmaple.com').save
      expect(user).to eq(false)
    end

    it 'ensures email presence' do
      # user = User.new(first_name: 'Last', last_name: 'Last').save
      # expect(user).to eq(false)

      # factory bot
      user = build(:user, first_name: 'Tom') 
      expect(user.email).to eq('steven@pinker.com')
    end

    it 'ensures save successfully' do
      # user = User.new(first_name: 'First', last_name: 'Last', email: 'sample@exmaple.com').save
      # expect(user).to eq(true)
    end
  end

  context 'scope tests' do
    let (:params) { {first_name: 'First', last_name: 'Last'} }
    before(:each) do
      User.new().save
      User.new(params).save
      User.new(params.merge(email: 'sample@exmaple.com')).save
      User.new(params.merge(email: 'sample@exmaple.com')).save
    end

    it 'should return users' do
      expect(User.all.size).to eq(2)
    end

  end
end
