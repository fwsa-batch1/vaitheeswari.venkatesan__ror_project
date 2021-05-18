class User < ActiveRecord::Base
  def to_pleasant_user_string
    "#{id}.  #{name}   #{email}   #{password}"
  end
end
