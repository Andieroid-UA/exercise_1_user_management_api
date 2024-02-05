class UsersController < ApplicationController
  # Go to routes.rb and look for /users
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users, status: 200
  end

  def show
    render json: @user, status: 200
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'User not found' }, status: :not_found  
  end

def create
  @user = User.new(user_params)
  if @user.save
    render json: @user, status: :created
  else
    render json: @user.errors, status: :unprocessable_entity
  end
end

def update
  if @user.update(user_params)
    render json: @user, status: :ok
  else
    render json: @user.errors, status: :unprocessable_entity
  end
rescue ActiveRecord::RecordNotFound
  render json: { error: 'User not found' }, status: :not_found 
end  

def destroy
  if @user.destroy
    render json: nil, status: :ok
  else
    render json: @user.errors, status: :unprocessable_entity
  end
rescue ActiveRecord::RecordNotFound
  render json: { error: 'User not found' }, status: :not_found 
end

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:full_name, :age, :email)
  end
end