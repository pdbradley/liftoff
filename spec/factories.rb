FactoryGirl.define do
  factory :member do
    phone_number "MyString"
    first_name "MyString"
    last_name "MyString"
    group nil
  end
  factory :group do
    name "MyString"
    user nil
  end
end
