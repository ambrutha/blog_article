class ProfilesController < ApplicationController

	def new
		@profile=Profile.new
	end
	def create
		@profile=Profile.new(params[:profile])
			@profile.user_id=current_user.id
		if @profile.save
		redirect_to arti_url
	else
	render :new
	end
	end
	
	def edit
		@profile=Profile.find_by_user_id(current_user.id)
	end
	def update
		@profile=Profile.find_by_user_id(current_user.id)
		p @profile
		if @profile.update_attributes(params[:profile])
		redirect_to arti_url, :notice => 'Updated user information successfully.'
		else
		render :edit
		end
	end
end
