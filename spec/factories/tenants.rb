FactoryGirl.define do
  factory :tenant do
    name { FFaker::Name.name }
    api_key { SecureRandom.hex(16) }
  end
end
