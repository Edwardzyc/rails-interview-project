class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title
  belongs_to :user
  has_many :answers
end
