FactoryGirl.define do
  factory :user do
    email
    password "123123"
  end

  factory :member do
    phone_number "MyString"
    first_name "MyString"
    last_name "MyString"
    group nil
  end

  factory :group do
    name "MyString"
    user
  end

  sequence :email do |n|
    "person#{n}@example.com"
  end
end
