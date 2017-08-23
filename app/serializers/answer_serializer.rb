class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :body
  belongs_to :user

end
