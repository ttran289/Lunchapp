class RoomsController < ApplicationController
	def index
		@rooms = Room.all
	end

	def new
		@room = Room.new
	end

	def create
		@room = Room.create(params.require(:room).permit(:name))
		if @room.save
			flash[:success] = "Start suggesting"
		redirect_to rooms_path
		else
			render 'new'
		end

	end

	def show
		@room = Room.find(params[:id])
		@lunch = @room.lunches
	end

	def edit
		@room = Room.find(params[:id])
	end

	def update
		@room = Room.find(params[:id])
		if @room.update(params.require(:room).permit(:name))
			flash[:success] = "Room update!!"
			redirect_to rooms_path
		else
			render 'edit'
		end
	end

	def destroy
		@room = Room.find(params[:id])
		@room.destroy
		redirect_to rooms_path
	end
end
