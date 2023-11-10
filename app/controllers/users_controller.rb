class UsersController < ApplicationController
  def show
     @user = current_user
     @books = @user.books.page(params[:page]) 
     @user = User.find(params[:id])
  end


  def edit
     @user = current_user
     unless @user.id == current_user.id
       redirect_to books_path
     end
     @user = User.find(params[:id])   
  end

  def index
     @books = Book.all
     @users = User.all
     @user = User.find_by(id: params[:id]) 
  if @user.nil?
  end
  end
  

def destroy
  @user = User.find(params[:id])
  if @user == current_user
  @user.destroy
  session[:user_id] = nil
  redirect_to root_path, notice: "Your account has been successfully deleted."
  else
  redirect_to root_path, alert: "You don't have permission to delete this user's account."
  end
end

  
def update
  @user = User.find(params[:id])
  if @user == current_user
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
    flash[:error] = 'Error' 
    render 'edit'
    end
  else
    redirect_to books_path, alert: "You don't have permission to edit this user's profile."
  end
end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :avatar)
  end
end