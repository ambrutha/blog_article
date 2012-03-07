class SessionsController < ApplicationController
def create
if user = User.authenticate(params[:email], params[:password])
session[:user_id] = user.id
if user.profile.present?
redirect_to arti_url, :notice => "Logged in successfully"
else
redirect_to new_profile_path, :noitce => "you have created successfully"
end
else
flash.now[:alert] = "Invalid login/password combination"
render :action => 'new'
end
end
def destroy
reset_session
redirect_to arti_url, :notice => "You successfully logged out"
end


end
