class ApplicationController < ActionController::API

  private

  def authenticate_request
    if !valid_authentication_header?
      render json: { message: 'Unauthorized' }, status: :unauthorized
    end
  end

  def valid_authentication_header?
    token = request.headers['Authorization']
    return false unless token.present?
    user = User::AUTH.key(token)
    return user.present?
  end

  def current_user
    token = request.headers["Authorization"]
    user = User::AUTH.key(token)
    User.find_by(username: user)
  end
end
