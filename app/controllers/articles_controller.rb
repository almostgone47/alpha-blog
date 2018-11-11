class ArticlesController < ApplicationController
  before_action :find_article, only: [:edit, :show, :update, :destroy]
  
  
  def index
    @article = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def edit
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created!"
      @article.save
      redirect_to article_path(@article)
    else
      flash[:notice] = "Error, try again"
      render 'new'
    end
  end
  
  def update
    if @article.update(article_params)
      flash[:notice] = "Article was successfully edited!"
      @article = Article.find(params[:id])
      redirect_to article_path
    else
      render 'edit'
    end
  end
  
  def show
  end
  
  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully deleted!"
    redirect_to articles_path
  end
  
  private
  
  def find_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :description)
  end
end