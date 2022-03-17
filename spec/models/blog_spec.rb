require 'rails_helper'

RSpec.describe Blog, type: :model do
  context 'validation tests' do
    it 'ensures title presence' do
      blog = build(:blog, title: nil)
      expect { blog.save! }.to raise_error(
        ActiveRecord::RecordInvalid, "Validation failed: Title can't be blank"
      )
    end

    it 'ensures subtitle presence' do
      blog = build(:blog, subtitle: nil)
      expect { blog.save! }.not_to raise_error
    end

    it 'ensures body presence' do
      blog = build(:blog, body: nil)
      expect { blog.save! }.to raise_error(
        ActiveRecord::RecordInvalid, "Validation failed: Body can't be blank"
      )
    end

    it 'ensures blog is approved' do
      blog = build(:approved_blog)
      expect (blog.status).to eq('approved')
    end
  end

  context 'scope tests' do
    before(:each) do
      create(:blog)
      create(:blog)
    end

    it 'should return blogs' do
      expect(Blog.all.size).to eq(2)
    end

  end
end
