module ArticlesHelper
  def tag_list(article)
    article.tags.map{|t| link_to t.value, tag_path(t.value)}.join(', ')
  end
end
