class ArticlesController < InheritedResources::Base
  include ApplicationHelper

  def index
    @articles = Article.last(5)
  end

  def new
    @article = current_user.articles.build
  end
end
