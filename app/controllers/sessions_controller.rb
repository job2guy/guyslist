class SessionsController < ApplicationController
  before_filter :login_required, :only => :destroy
  
  def new
  end
  
  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully."
      if user.hr_status
        redirect_to :controller=>"hrs"
      else
        redirect_to :controller=>"home"
      end
      
      #redirect_to_target_or_default(root_url)
    else
      flash.now[:error] = "Invalid login or password."
      render :action => 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to root_url
  end
end
