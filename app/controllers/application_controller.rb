class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_params, if: :devise_controller?

  protected

  def configure_permitted_params
    devise_parameter_sanitizer.permit(:invite, keys: [:organization_id, :male, :title, :first_name, :last_name, :email, :activated_offline, :admin])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:male, :title, :first_name, :last_name, :email, :activated_offline, :admin, organization_attributes: [:id, :name, :street_name, :street_number, :postal_code, :city, :is_company]])
  end

  def success_message(options = {})
    translate_message(:success, options)
  end

  def error_message(options = {})
    translate_message(:error, options)
  end

  def translate_message(kind, options)
    sub_type = options.delete(:sub_type)
    scope = ([:controllers] + self.class.name.deconstantize.split('::').map(&:underscore) << controller_name << params[:action])
    if sub_type.nil?
      key = kind
    else
      scope << kind
      key = sub_type
    end
    I18n.t key, options.merge(scope: scope)
  end

end
