class Tenant < ActiveRecord::Base

  before_create :generate_api_key
  
  validates :name, :api_key, presence: true
  validates :api_key, uniqueness: true

  private

  def generate_api_key
    self.api_key = SecureRandom.hex(16)
  end

end
