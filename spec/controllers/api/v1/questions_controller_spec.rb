require 'rails_helper'

RSpec.describe Api::V1::QuestionsController, type: :controller do
  let!(:tenant) { FactoryGirl.create(:tenant) }
  describe "#index" do
    it "should return an empty array when there are no questions" do
      get :index, { api_key: tenant.api_key }
      expect(response.body).to eq("[]")
    end

    it "should return a json representation of questions/answers" do
      FactoryGirl.create(:answer)
      FactoryGirl.create(:answer)
      get :index, { api_key: tenant.api_key }
      expect(Question.count).to eq(2)
      expect(response.body).to eq(ActiveModelSerializers::SerializableResource.new(Question.all, include: ['user', 'answers', 'answers.user']).to_json)
    end

    it "should not return json representation of private questions" do
      @answer = FactoryGirl.create(:answer)
      @answer.question.update(private: true)
      get :index, { api_key: tenant.api_key }
      expect(response.body).to eq("[]")
    end
  end

end
