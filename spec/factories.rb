FactoryGirl.define do
  factory :user do
    email
    password "123123"
  end

  factory :member do
    phone_number "4046674875"
    first_name
    last_name
  end

  factory :group do
    sequence(:name) {|n| "Group{n}"}
    user
  end

  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :first_name do |n|
    "FirstName #{n}"
  end
  sequence :last_name do |n|
    "LastName #{n}"
  end
end
