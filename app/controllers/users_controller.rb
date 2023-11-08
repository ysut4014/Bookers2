class UsersController < ApplicationController
  def show
     @user = current_user
     @books = @user.books.page(params[:page])   
  end

  def edit
     @user = current_user
     user = User.find(params[:id])
     unless @user.id == current_user.id
       redirect_to books_path
     end
     @user = User.find(params[:id])   
  end

  def index
     @books = Book.all
     @users = User.all
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
    user = User.find(params[:id])
    @user = User.find_by(id: params[:id])
     unless usr.id == current_user.id
       redirect_to books_path
     end
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :avatar)  # 必要に応じて他のカラムを追加
  end
end