FactoryBot.define do
  factory :user do
    first_name { "Steven" }
    last_name { "Pinker" }
    email { "steven@pinker.com" }
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
