I18nDemo::Application.routes.draw do
  get "articles/show"

  devise_for :users
  resources :articles
  get "welcome/index", as: "welcome"
  root to: 'welcome#index'
end

ActionDispatch::Routing::Translator.translate_from_file(
  'config/locales/routes.yml', {
    prefix_on_default_locale: true,
    keep_untranslated_routes: true })

I18nDemo::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
end
