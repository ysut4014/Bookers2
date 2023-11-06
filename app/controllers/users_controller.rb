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
end
