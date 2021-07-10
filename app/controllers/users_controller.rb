class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in
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
    user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
    if user.save
      redirect_to "/todos"
      session[:current_user_id] = user.id
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to "/users/new"
    end
  end

  def login
    email = params[:email]
    password = params[:password]
    user = User.where(email: email, password: password).first
    display_text = user ? "true" : "false"
    render plain: display_text
  end
end
