class ArticlesController < ApplicationController
  before_filter :authenticated, only: [:new, :create, :edit, :update, :destroy]

  include ApplicationHelper

  def index
    @articles = Article.last(5)
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
      redirect_to root_path, notice: "Update to '#{@article.title}' successful."
    else
      flash.now[:error] = "You need to fill out every field."
      render 'edit'
    end
  end

  def create
    @article = current_user.articles.build(params[:article])
    if @article.save
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
end