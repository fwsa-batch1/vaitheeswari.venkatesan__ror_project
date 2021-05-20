class User < ActiveRecord::Base
  def to_pleasant_user_string
    "#{id}. NAME: #{name} EMAIL:  #{email} PASSWORD:  #{password}"
  end
end
