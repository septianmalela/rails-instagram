class UsersController < ApplicationController

	def index
		@user = @user.filter_by_starts_with(params[:name]) if params[:name].present?
	end

	def show
		@user = User.find(params[:id])
	end

	def follow
		@user = User.find(params[:id])
        follow = current_user.followings.create(follower_id: @user.id)
        redirect_back fallback_location: user_path(@user)
	end

	def unfollow
		@user = User.find(params[:id])
		d = current_user.followings.find_by(follower_id: @user.id)
		d.destroy
		redirect_back fallback_location: user_path(@user)
	end

	def search
		if params[:search].blank?  
            redirect_to(root_path, alert: "Empty field!") and return  
        else  
        	@parameter = params[:search].downcase  
    		@results = User.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
        end  
	end

end
