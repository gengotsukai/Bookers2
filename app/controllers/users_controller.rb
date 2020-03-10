class UsersController < ApplicationController
	def show
	  	@user = User.find(params[:id])
	  	@book = Book.new
	end
	
	def edit
	  	@user = User.find(params[:id])
	end
	
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user.id), flash: { notice: 'You have updated user successfully.' }
		else
			render :edit
		end
	end
	
	def index
	end

	def destroy
		user = User.find(params[:id])
		user.delete
	end

	def user_params
        params.require(:user).permit(:name, :introduction, :profile_image)
    end
end
