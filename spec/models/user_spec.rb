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
      user = User.new(first_name: 'Last', last_name: 'Last').save 
      expect(user).to eq(false)
    end

    it 'ensures uniqueness of email' do
      user_1 = User.new(first_name: 'First', last_name: 'Last', email: 'sample@exmaple.com').save
      expect(user_1).to eq(true)

      user_2 = User.new(first_name: 'First', last_name: 'Last', email: 'sample@exmaple.com').save
      expect(user_2).to eq(false)
    end

    it 'ensures save successfully' do
      user = User.new(first_name: 'First', last_name: 'Last', email: 'sample@exmaple.com').save
      expect(user).to eq(true)
    end
  end

  context 'scope tests' do
    let (:params) { {first_name: 'First', last_name: 'Last'} }
    before(:each) do
      User.new().save
      User.new(params).save
      User.new(params.merge(email: 'sample@unique1.com')).save
      User.new(params.merge(email: 'sample@unique2.com')).save
    end

    it 'should return users' do
      expect(User.all.size).to eq(2)
    end

    it 'should create a user blog' do
      create(:user) do |user|
        user.blogs.create(attributes_for(:blog))
      end
    end

    it 'should create a user with blogs' do
      user = create(:user)
      expect(user_with_blogs.blogs.length).to eq(5)
    end

  end
end
