class UsersController < ApplicationController
	before_filter :authenticate, :only => [:edit, :update]

  def new
   @user=User.new
  end

  def create
	@user=User.create(params[:user])
	if @user.save
	redirect_to articles_path
	else
	render :action => "new"
	end
  end

  def edit
	@user = User.find(params[:id])
  end

  def update
	@user = User.find(params[:id])
	if @user.update_attributes(params[:user])
	redirect_to articles_path
	else
	render :action => 'edit'
	end
  end


end
