class TagsController < ApplicationController
  def posts_by_tag
    @articles = Tag.where("lower(value) = lower(?)", params[:value]).map{|t| t.article }
    @tag = params[:value]
  end
end
