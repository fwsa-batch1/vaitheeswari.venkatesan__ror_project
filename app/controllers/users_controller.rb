class UsersController < ApplicationController
  def new
    render "users/new"
  end

  # To show all the users
  def index
    render plain: User.all.map { |user| user.to_pleasant_user_string }.join("\n")
  end

  # To create a new user
  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(first_name: first_name, last_name: last_name, email: email, password: password)
    redirect_to "/"
  end

  # To check if there is a user with the given email and password
  def login
    email = params[:email]
    password = params[:password]
    user = User.find_by(email: email)
    if !(user == nil)
      response_text = (user[:password].eql? password) ? "true" : "false"
    else
      response_text = "false"
    end
    render plain: response_text
  end
end
