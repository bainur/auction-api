class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])
    if user && user&.authentication(params[:password])
      render json: { auth: User::AUTH[user.username.to_sym] }, status: 200
    else
      render json: { message: 'Unauthorized' }, status: :unauthorized
    end
  end
end
