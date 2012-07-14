ActiveAdmin.register Article do
  index do
    column :id
    column :slug
    column :title

    default_actions
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
