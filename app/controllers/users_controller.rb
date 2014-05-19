class UsersController < ApplicationController
	
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome to LunchVote!!"
			redirect_to :root
		else
			render :new
		end
	end

	def upvote
		@user.vote(@post, :up)
	end
	protected


	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
end
