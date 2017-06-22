class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])

      if user.nil?
        flash.now[:errors] = ["invalid username or password"]
        render :new
      else
        login!(user)
        redirect_to cats_url
      end
  end

  def destroy
    logout!
    redirect_to new_session_url

  end


  private

  def session_params
    params.require(:user).permit(:user_name, :password)
  end
end
