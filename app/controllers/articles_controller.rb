class ArticlesController < ApplicationController
  before_filter :authenticated, only: [:new, :create, :edit, :update, :destroy]

  include ApplicationHelper

  def index
    get_articles 5
  end

  def archive
    get_articles 15
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = current_user.articles.build
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])
    if @article.update_attributes(params[:article])
      update_tags
      redirect_to root_path, notice: "Update to '#{@article.title}' successful."
    else
      flash.now[:error] = "You need to fill out every field."
      render 'edit'
    end
  end

  def create
    @article = current_user.articles.build(params[:article])
    if @article.save
      update_tags
      redirect_to root_path, notice: "Post successful."
    else
      flash.now[:error] = "You need to fill out every field."
      render 'new'
    end
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to root_path, notice: "Article has been deleted."
  end

  private

    def authenticated
      redirect_to root_path if current_user.nil?
    end

    def get_articles(count)
      @articles = Article.order("created_at DESC").paginate(page: params[:page], per_page: count)
    end

    def update_tags
      if params[:tags]
        currentTags = @article.tags.map{|t| t.value}
        toAdd = params[:tags] - currentTags
        toDel = currentTags - params[:tags]

        toAdd.each do |v|
          @article.tags.create(value: v)
        end
        toDel.each do |v|
          @article.tags.find_by_value(v).destroy
        end
      end
    end
end
