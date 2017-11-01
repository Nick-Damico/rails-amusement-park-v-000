class UsersController < ApplicationController
	before_action :require_login, only: [:show, :destroy]

	def new		
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			render.now :new
		end
	end

	def show
		if params[:attraction]
			ride = Ride.create(user_id: params[:id], attraction_id: params[:attraction][:id])
			result = ride.take_ride
			if result.class == String
				flash[:notice] = result
			else
				flash[:notice] = "Thanks for riding the #{ride.attraction.name}!"
			end
		end
		@user = User.find(params[:id])
	end

	def destroy
		if session[:user_id]
			session.delete :user_id
		end
		redirect_to root_path
	end

	private
	def user_params
		params.require(:user).permit(
			:name,
			:password,
			:password_confirmation,
			:height,
			:happiness,
			:nausea,
			:tickets,
			:admin
			)
	end
end
