class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def create

    @article = Article.new(article_params)
    @article.save
    # no need for app/views/articles/create.html.erb
    redirect_to article_path(@article)
  end

  def new
    @article = Article.new # needed to instantiate the form_for
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    # no need for app/views/articles/update.html.erb
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    # no need for app/views/articles/destroy.html.erb
    redirect_to articles_path
  end

  private


  def article_params
    params.require(:article).permit(:title, :content)
  end
end
