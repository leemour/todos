class API::V1::BaseController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :check_format, :destroy_session, :authenticate_user_from_token!

  respond_to :json
  layout false
  
  rescue_from ActiveRecord::RecordNotFound, with: :not_found!
  # rescue_from StandardError, with: :unknown_error!

  private

  def destroy_session
    request.session_options[:skip] = true
  end

  def authenticate_user_from_token!
    user_email = params[:email].presence
    user       = user_email && User.find_by(email: user_email)
    if user && Devise.secure_compare(user.authentication_token, params[:token])
      # @current_user = user
      sign_in :user, user
    else
      return unauthenticated!
    end
  end

  def unauthenticated!
    response.headers['WWW-Authenticate'] = "Token realm=Application"
    render json: { error: 'Bad credentials' }, status: 401
  end

  def not_found!
    return api_error(status: 404, errors: 'Not found')
  end

  def unknown_error!
    return api_error(status: 500, errors: 'Unknown error')
  end

  def api_error(status: 500, errors: [])
    unless Rails.env.production?
      puts errors.full_messages if errors.respond_to? :full_messages
    end
    head status: status and return if errors.empty?
    render json: jsonapi_format(errors).to_json, status: status
  end

  def jsonapi_format(errors)
    messages = if errors.is_a?(String) || !errors.respond_to?(:messages)
      [ { detail: errors } ] 
    else
      errors.messages.map do |attribute, errors_list|
        { attribute: attribute, detail: errors_list.join(', ') }
      end
    end
    { errors: messages }
  end

  def check_format
    return if params[:format] == "json" || request.headers["Accept"] =~ /json/
    render nothing: true, status: 406
  end
end
