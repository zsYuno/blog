class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  #def show
    #@article = Article.find(params[:id])
  #end

  def new
    @article = Article.new
  end

  def edit
    #@article = Article.find(params[:id])
  end

  def update
    #@article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to action: :index, notice: '記事を更新しました'
    else
      render :edit
    end
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to action: :index, notice: '記事を投稿しました'
    else
      render :index
    end
  end

  def destroy
    #@article = Article.find(params[:id])
    @article.destroy
    redirect_to action: :index, notice: '記事を削除しました'
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end
  
    def article_params
      params.require(:article).permit(:title, :content)
      #params.fetch(:article, {}).permit(:title, :content)
    end
end
