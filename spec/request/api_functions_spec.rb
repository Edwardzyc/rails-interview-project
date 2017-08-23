require "rails_helper"

RSpec.describe "API functions", :type => :request do

  it "only allows valid api keys to go through with the request" do
    get "/api/v1/questions.json"
    expect(response.body).to eq({message: "API key not valid"}.to_json)
    expect(response.status).to eq(401)

    get "/api/v1/questions.json?api_key=edward"
    expect(response.body).to eq({message: "API key not valid"}.to_json)
    expect(response.status).to eq(401)

    @tenant = FactoryGirl.create(:tenant)
    get "/api/v1/questions.json?api_key=#{@tenant.api_key}"
    expect(response.body).to eq("[]")
    expect(response.status).to eq(200)
  end

  it "increments request counter everytime a valid request goes through" do
    @tenant = FactoryGirl.create(:tenant)
    expect { get "/api/v1/questions.json?api_key=edward" }.to change { @tenant.reload; @tenant.api_request_count }.by(0)
    expect { get "/api/v1/questions.json" }.to change { @tenant.reload; @tenant.api_request_count }.by(0)
    expect { get "/api/v1/questions.json?api_key=#{@tenant.api_key}" }.to change { @tenant.reload; @tenant.api_request_count }.by(1)
    expect(@tenant.api_request_count).to eq(1)

  end

end