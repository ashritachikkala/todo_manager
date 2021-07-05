class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    render "users/new"
  end
  
  def index
    render plain: User.order(:id).map { |user| user.to_display_user }.join("\n")
  end

  def show
    id = params[:id]
    user = Users.find(id)
    render plain: user.to_display_user
  end

  def create
    User.create!(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
    redirect_to "/"
  end

  def login
    email = params[:email]
    password = params[:password]
    user = User.where(email: email, password: password).first
    display_text = user ? "true" : "false"
    render plain: display_text
  end
end
