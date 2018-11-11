class ArticlesController < ApplicationController
  
  def new
    @article = Article.new
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
  
  def show
    @article = Article.find(params[:id])  
  end
  
  private
  
  def article_params
    params.require(:article).permit(:title, :description)
  end
end