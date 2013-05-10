class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  private

  def set_locale
    if lang = request.env['HTTP_ACCEPT_LANGUAGE']
      lang = lang[/^[a-z]{2}/]
      lang = :"pt-BR" if lang == "pt"
    end
    I18n.locale = params[:locale] || lang || I18n.default_locale
  end
end
