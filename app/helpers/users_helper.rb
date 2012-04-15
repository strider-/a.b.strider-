module UsersHelper
  def latest_articles(user)
    user.articles.last(5).reverse.map{|a| link_to a.title, article_path(a)}.join('", <br />          "')
  end
end
