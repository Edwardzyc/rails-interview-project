class Api::V1::QuestionsController < Api::V1::BaseController

  def index
    @questions = Question.visible.includes(:user, answers: [:user])
    render json: @questions, include: ['user', 'answers', 'answers.user']
  end
  
end
