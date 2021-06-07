class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :email, presence: true
  has_many :todos
  has_secure_password

  def to_pleasant_user_string
    "#{id}. NAME: #{first_name} EMAIL:  #{email} PASSWORD:  #{password}"
  end
end
