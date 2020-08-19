class UsersController < ApplicationController

    def index 
        @users = User.all
    end

    def new
        @user = User.new
        @errors = flash[:errors]
    end

    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          flash[:errors] = @user.errors.full_messages
          redirect_to new_user_path
        end
      end

    def show
        @user = User.find(params[:id])
    end



    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        if @user.valid?
            redirect_to profile_path
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to edit_profile_path
        end
    end

    def profile
      @user = User.find(params[:id])
    end

    
    
    private


    def user_params
        params.require(:user).permit(:username, :password)
    end
end
