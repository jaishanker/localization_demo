require 'spec_helper'

describe ArticlesController do
  render_views

  describe "GET 'show'" do
    it "returns http success" do
      I18n.locale = :en
      @article = Article.create title: "hello-world", body: "**test**"
      get 'show', id: @article.slug, locale: "en"
      response.should be_success

      response.body.should include "<p><strong>test</strong></p>\n"
    end
  end

end
