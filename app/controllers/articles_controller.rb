class ArticlesController < ApplicationController

  before_action :set_article, only: %i[show edit update destroy]
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit;end

  def show;end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @article.destroy
      redirect_to articles_path
    else
      render :index
    end
  end

  def set_article
    @article = Article.find_by_id(params[:id])
  end
  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
