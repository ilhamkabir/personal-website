FactoryBot.define do
  factory :user, aliases: [:author, :commenter] do
    first_name { 'John' }
    last_name { 'Doe' }

    sequence(:email) { |n| "#{last_name}-#{n}@example.com".downcase }
    created_at { 3.days.ago }
    updated_at { 1.day.ago }
  end
end

def user_with_blogs(blogs_count: 5)
  create(:user) do |user|
    create_list(:blog, blogs_count, user: user)
  end
end