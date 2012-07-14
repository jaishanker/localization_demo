class AddHtmlCacheFieldsToArticle < ActiveRecord::Migration
  def change
    add_column :article_translations, :body_html, :text
  end
end
