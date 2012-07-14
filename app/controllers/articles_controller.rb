class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    @body_html = RDiscount.new(@article.body || "").to_html.html_safe
  end
end
