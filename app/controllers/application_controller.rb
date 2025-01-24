class ApplicationController < ActionController::API
  def authenticate_request
    token = request.headers["Authorization"]&.split(" ")&.last
    decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base, true, { algorithm: "HS256" }) rescue nil
    @current_user = User.find_by(id: decoded_token[0]["user_id"]) if decoded_token
  end
end
