FactoryGirl.define do
  factory :product do
    sequence(:name) { |i| "product#{i}" }
  end
end
