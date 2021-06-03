class User < ActiveRecord::Base
  has_many :todos
  has_secure_password

  def to_pleasant_user_string
    "#{id}. NAME: #{first_name} EMAIL:  #{email} PASSWORD:  #{password}"
  end
end
