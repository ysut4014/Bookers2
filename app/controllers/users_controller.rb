class UsersController < ApplicationController
  def show
     @user = User.find(params[:id])
     @books = @user.books.page(params[:page])   
  end

  def edit

     @user = User.find(params[:id])
  end
  def index
    @userd = User.all
  
  end
  def create
    super
    if resource.save
      set_flash_message :notice, :sined_up
    end
    
    
  end
end
