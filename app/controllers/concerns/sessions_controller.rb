class SessionsController < BaseController
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = JWT.encode({ user_id: user.id }, Rails.application.secret_key_base)
      render json: { token: token }
    else
      render json: { error: '認証に失敗しました' }, status: :unauthorized
    end
  end
end