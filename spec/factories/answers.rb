FactoryGirl.define do
  factory :answer do
    body { FFaker::HipsterIpsum.sentence }
    question
    user
  end
end
