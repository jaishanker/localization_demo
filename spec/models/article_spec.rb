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

  context "multiple translations" do
    before(:each) do
      @params = {"translations_attributes"=>{
        "0"=>{"title"=>"Hello World", "body"=>"**Markdown Test**", "locale"=>"en"},
        "1"=>{"title"=>"Ola Mundo", "body"=>"__Teste de Markdown__", "locale"=>"pt-BR"}}}
    end

    it "should accept multiple translations at once" do
      @article = Article.new(@params)
      @article.translations.size.should == 2
      @article.save
      @article.reload
      @article.translations.size.should == 2
    end

    it "should generate all the HTMLs at once" do
      @article = Article.create(@params)
      I18n.locale = :en
      @article.body_html.should == "<p><strong>Markdown Test</strong></p>\n"
      I18n.locale = :"pt-BR"
      @article.body_html.should == "<p><strong>Teste de Markdown</strong></p>\n"
    end
  end

  context "slug" do
    it "should generate a slug" do
      @article.slug.should == "hello-world"
    end
  end
end
