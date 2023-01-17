class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_logged_in

  def show
    user = User.find(session[:user_id])
    render json: user, status: :ok
  end

  private

  def not_logged_in
    render json: { user: 'Please log in to view specific user information' }, status: :unauthorized
  end
end
