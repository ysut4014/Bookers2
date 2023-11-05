class UsersController < ApplicationController
  def show
     @user = current_user
     @books = @user.books.page(params[:page])   
  end

  def edit

     @user = current_user
  end
  def index
    @users = User.all
  
  end
  def create
    super
    if resource.save
      set_flash_message :notice, :sined_up
    end
    
    
  end
end
