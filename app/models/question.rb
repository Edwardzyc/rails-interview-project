class Question < ActiveRecord::Base

  has_many :answers
  belongs_to :user

  validates :title, :user, presence: true

  scope :visible, -> { where(private: false) }

end
