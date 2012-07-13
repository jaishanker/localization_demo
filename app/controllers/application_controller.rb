class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale
  before_filter :set_locale_from_url

  private

  def set_locale
    lang = request.env['HTTP_ACCEPT_LANGUAGE']
    lang = lang[/^[a-z]{2}/]
    lang = :"pt-BR" if lang == "pt"
    I18n.locale = params[:locale] || lang
  end
end
