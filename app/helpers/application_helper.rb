module ApplicationHelper
  def language_links
    links = []
    I18n.available_locales.each do |locale|
      locale_key = "translation.#{locale}"
      if locale == I18n.locale
        links << I18n.t(locale_key)
      else
        links << link_to(I18n.t(locale_key), url_for(locale: locale.to_s))
      end
    end
    content_tag(:p, links.join(" | ").html_safe)
  end
end
