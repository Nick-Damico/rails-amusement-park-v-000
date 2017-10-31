class UsersController < ApplicationController

	def new		
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			
			session[:user_id] = @user.id
			redirect_to "/users/#{@user.id}"
		else
			render.now :new
		end
	end

	def show
		@user = User.find(params[:id])
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
