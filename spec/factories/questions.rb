FactoryGirl.define do
  factory :question do
    title { FFaker::HipsterIpsum.sentence.gsub(/\.$/, "?") }
    user
    
  end
end
