class SessionsController < ApplicationController
    def create
      if user_authenticated_successfully
        flash[:notice] = "successfully"
        redirect_to root_path
      else
        flash.now[:alert] = "error"
        render :new
        
      end
    end
end
