class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  layout :set_layout
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def index
    render text: '<h1>Raye7 RaMin0</h1>'.html_safe, layout: true
  end
  
protected

  # Allow extra fields through devise's sanitized parameters
  def configure_permitted_parameters
    case resource_name
    when :user
      %w[name home_address home_longitude home_latitude work_address work_longitude work_latitude].each do |param|
        devise_parameter_sanitizer.for(:sign_up)        << param
        devise_parameter_sanitizer.for(:account_update) << param
      end
    end
  end
  
  # Customized redirect back URL after logging in according to application scope (user/admin)
  def after_sign_in_path_for(resource)
    resource_name == :user ? root_path : dashboard_root_path
  end
  
  # Customize the layout used according to application scope (user/admin)
  def set_layout
    if devise_controller?
      case resource_name
      when :admin
        'dashboard/dashboard'
      else
        'application'
      end
    else
      nil
    end
  end
end
