ActiveAdmin.register Article do
  index do
    column :id
    column :slug
    column :title

    default_actions
  end

  show do |article|
    attributes_table do
      row :slug
      I18n.available_locales.each do |locale|
        h3 I18n.t(locale, scope: ["translation"])
        div do
          h4 article.translations.where(locale: locale).first.title
        end
        div do
          article.translations.where(locale: locale).first.body_html.html_safe
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.input :slug
    f.globalize_inputs :translations do |lf|
      lf.inputs do
        lf.input :title
        lf.input :body

        lf.input :locale, :as => :hidden
      end
    end

    f.buttons
  end
end
