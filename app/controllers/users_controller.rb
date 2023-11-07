class UsersController < ApplicationController
  def show
     @user = current_user
     @books = @user.books.page(params[:page])   
  end

  def edit

     @user = current_user
  end
  def index
      @user = User.find_by(id: params[:id]) # ユーザーが存在しない場合、nilが返される
  if @user.nil?
  end
  end
  def create    
    super
    if resource.save
      set_flash_message :notice, :sined_up
    end
  end
  def update
     @user = User.find_by(id: params[:id])
   if @user.update(user_params)
     tedirect_to @user, notice: 'User was successfully updated.'
   else
     render 'edit'
　 end
　private

  def user_params
     params.require(:user).permit(:username, :email, :password)
  end
  end
end
