class ApplicationController < ActionController::Base
  include TheRole::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :update_sanitized_params, if: :devise_controller?

  

  def update_sanitized_params
    devise_parameter_sanitizer.for(:account_update ) << :role
  end

  def after_sign_in_path_for(resource)
    if session['facebook_data'] && current_user.uid.nil?

    end
    session.keys.grep(/^facebook/).each { |k| session.delete(k)}
  end

  def access_denied
    flash[:error] = t('the_role.access_denied')
    #redirect_to(:back)
  end

  
end
