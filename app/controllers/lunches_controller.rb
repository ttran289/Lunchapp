class LunchesController < ApplicationController
	
	def index
		@lunches = Lunch.all
	end
	def new
		@lunch = Lunch.new
		@room = Room.find(params[:room_id])
	end

	def create
		# raise params.inspect
		@room = Room.find(params[:room_id])

		@lunch = @room.lunches.new(params.require(:lunch).permit(:name, :time, :date))
		if @lunch.save
			flash[:success] = "Thank you for helping your classmates!!"
		redirect_to @room
		else
			render 'new'
		end
	end

	def show
		@lunch =Lunch.find (params[:id])
	end

	def edit
		@lunch = Lunch.find(params[:id])
	end

	def update
		@lunch = Lunch.find(params[:id])

		if @lunch.update (lunch_params)
			flash[:success] = "Lunch Updated!!"
			redirect_to room_lunches_path
		else
			render 'edit'
		end
	end
	
	def upvote
		@lunch = Lunch.find(params[:id])
		current_user.vote(@lunch,:up)
		redirect_to room_path(params[:room_id])
	end

	


	def destroy
		@lunch = Lunch.find(params[:id])
		@lunch.destroy
		redirect_to room_path(params[:room_id])
	end
end


