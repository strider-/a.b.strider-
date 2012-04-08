class TagsController < ApplicationController
  def posts_by_tag
    @articles = Tag.find_all_by_value(params[:value]).map{|t| t.article }
    @tag = params[:value]
  end
end
