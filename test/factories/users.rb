FactoryBot.define do
  factory :user, aliases: [:author, :commenter] do
    first_name { 'John' }
    last_name { 'Doe' }

    sequence(:email) { |n| "#{last_name}-#{n}@example.com".downcase }
    created_at { 3.days.ago }
    updated_at { 1.day.ago }
    # blog # implicite 
    # association :blog #explicit

    # trait :enlightenment_now do 
    #   assocation :blog, factory :pinker_blog
    # end

    # factory :pinker_user, traits: [:enlightenment_now]
  end
end
