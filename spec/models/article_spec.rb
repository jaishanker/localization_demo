require 'spec_helper'

describe Article do
  before(:each) do
    I18n.locale = :en
    @article = Article.create title: "Hello World", body: "**Test**"
    I18n.locale = :"pt-BR"
    @article.update_attributes(title: "Ola Mundo", body: "__Teste__")
  end

  context "translations" do
    it "should read the correct translation" do
      @article = Article.last
      I18n.locale = :en
      @article.title.should == "Hello World"
      @article.body.should == "**Test**"
      I18n.locale = :"pt-BR"
      @article.title.should == "Ola Mundo"
      @article.body.should == "__Teste__"
    end

    it "shouls generate the correct HTML" do
      @article = Article.last
      I18n.locale = :en
      @article.body_html.should == "<p><strong>Test</strong></p>\n"
      I18n.locale = :"pt-BR"
      @article.body_html.should == "<p><strong>Teste</strong></p>\n"
    end
  end

  context "slug" do
    it "should generate a slug" do
      @article.slug.should == "hello-world"
    end
  end
end
