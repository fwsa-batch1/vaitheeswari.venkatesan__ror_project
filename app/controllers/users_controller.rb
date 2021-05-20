class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_pleasant_user_string }.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(name: name, email: email, password: password)
    response_text = "New User is created with id #{new_user.id}"
    render plain: response_text
  end

  def login
    email = params[:email]
    password = params[:password]
    user = User.find { |user| user.email == email }
    if !(user == nil)
      response_text = (user[:password].eql? password) ? "true" : "false"
    else
      response_text = "false"
    end
    render plain: response_text
  end
end
