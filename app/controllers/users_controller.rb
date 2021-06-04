class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "new"
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
end
