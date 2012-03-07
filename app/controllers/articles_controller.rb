class ArticlesController < ApplicationController
before_filter :authenticate, :except => [:index, :show, :notify_friend]

  def index
	@article=Article.all
  end

  def new
	@article=Article.new # To view the form for new object
  end

  def create
	@article=Article.new(params[:article]) #To create a new article
	respond_to do |format|
	@article.user_id=current_user.id
	if @article.save
	format.html {redirect_to (arti_url, :notice => "Article successfully created.")}
        else
        format.html { render :action => "new" }
	end
	end
	end

  def show
	@article=Article.find(params[:id])
  end 

  def edit
	@article=Article.find(params[:id])
  end

  def update
	@article=Article.find(params[:id])
	respond_to do |format|
	if @article.update_attributes(params[:article])
	format.html {redirect_to (arti_url, :notice => "Article successfully updated.")}
        else
        format.html { render :action => "edit" }
	end
	end
	end
  
  def destroy
      @article=Article.find(params[:id])
      respond_to do |format|
	if @article.destroy
	format.html {redirect_to (arti_url, :notice => "Article successfully deleted.")}
	end
	end
	end
def notify_friend
@article = Article.find(params[:id])
Notifier.email_friend(@article, params[:name], params[:email]).deliver
redirect_to @article, :notice => "Successfully sent a message to your friend"
end

end

