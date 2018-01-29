class ArticlesController < ApplicationController
  before_action :require_login, except: [:show, :index]

  include ArticlesHelper
  def new
    @article =Article.new()
  end
  def index
    @articles=Article.all
    @tags=Tag.all
  end
  def create
    @article =Article.new(articleParam)
    @article.save
    flash.notice= "The Article '#{@article.title}' was created succefully!"
    redirect_to @article
  end
  def show
    @article=Article.find(params[:id])
    @comment=Comment.new
    @comment.article_id=@article.id
  end
  def edit
    @article = Article.find(params[:id])
  end
  def update
    @article=Article.find(params[:id])
    @article.update(articleParam)
    flash.notice= "The Article '#{@article.title}' was updated succefully!"
    redirect_to @article
  end
  def destroy
    @article=Article.find(params[:id])
    @article.destroy()
    flash.notice= "The Article '#{@article.title}' was removed!"
    redirect_to articles_path
  end
end
