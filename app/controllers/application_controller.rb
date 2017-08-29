class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :set_locale
 
  private
  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end

  def set_locale
    I18n.locale = set_locale_from_routes || set_locale_from_browser_settings || I18n.default_locale
  end
  
  def set_locale_from_routes
    return params[:locale] if params[:locale].present?
  end
  
  def set_locale_from_browser_settings
    locale = extract_locale_from_accept_language_header
    available_locales = ["en", "de"]
    return locale if available_locales.include? locale
  end
  
  def default_url_options
    { locale: I18n.locale }
  end
end
