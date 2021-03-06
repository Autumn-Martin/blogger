class ArticlesController < ApplicationController
  before_action :set_article, only: [:destroy, :edit, :show, :update]
  def index
    @articles = Article.all
  end

  def show
    # @article = Article.find(params[:id]) #replaced by before_action set_article
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    flash.notice = "Article #{@article.title} was created!"

    redirect_to article_path(@article)
  end

  def destroy
    # Article.destroy(params[:id]) #replaced by before_action set_article
    @article.destroy

    flash.notice = "Article #{@article.title} was deleted!"

    redirect_to articles_path
  end

  def edit
    # @article = Article.find(params[:id]) #replaced by before_action set_article
  end

  def update
    @article.update(article_params)

    flash.notice = "Article #{@article.title} was updated!"

    redirect_to article_path(@article)
  end
  private

    def article_params
      params.require(:article).permit(:title, :body)
    end

    def set_article
      @article = Article.find(params[:id])
    end
end
