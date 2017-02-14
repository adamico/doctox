FactoryGirl.define do
  factory :information do
    sequence(:name) { |i| "information#{i}" }
    product
  end
end
