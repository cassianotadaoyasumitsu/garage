class UsersController < ApplicationController

    def show
        @user = current_user
        # Render a view with @user data for display
      end

    def edit
        @user = User.find(params[:id])
        # Render a view with a form to edit an existing user
      end
    
      def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to @user, notice: 'User was successfully updated.'
        else
          render :edit
        end
      end
    
      def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_url, notice: 'User was successfully destroyed.'
      end
    
      private
    
      def user_params
        params.require(:user).permit(:name, :username, :contact, :user_type, :address, :email, :password)
        # Define the allowed parameters for user creation/update
      end
end
