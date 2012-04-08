module ArticlesHelper
  def tag_list(article)
    article.tags.map{|t| link_to t.value}.join(', ')
  end

  def edit_link(article)
    link_to "edit", edit_article_path(article)
  end

  def delete_link(article)
    link_to "delete", article, method: :delete, confirm: "Are you sure you want to delete #{article.title}?"
  end
end
