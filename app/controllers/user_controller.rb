class UserController < ApplicationController
  def show
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(params_form)
    @user.confirmed_at = DateTime.now
    if @user.save
      flash[:notice]="created a user"
      redirect_to root_path
    else
      flash[:notice]='create fail'
      redirect_to root_path
    end
  end
  private
  def params_form
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
