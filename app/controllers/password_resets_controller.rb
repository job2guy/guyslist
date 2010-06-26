class PasswordResetsController < ApplicationController
  before_filter :load_user_using_perishable_token, :only => [ :edit, :update ]


  def new  
    render  
  end  
  
  def edit  
    @user = User.find_by_id(params[:id])
    render  
  end  
  
  def create  
    @user = User.find_by_email(params[:email])  
    if @user  
      @user.deliver_password_reset_instructions!
      flash[:notice] = "Instructions to reset your password have been emailed to you"
      redirect_to root_path
      #redirect_to edit_password_reset_path(@user)
    else  
      flash[:notice] = "No user was found with that email address #{params[:email]}"  
      render :action => :new  
    end  
  end  
  
  def update
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      flash[:success] = "Your password was successfully updated"
      redirect_to :controller=>"home"
    else
      render :action => :edit
    end

#    @user = User.find_by_id(params[:id])
#    @user.password = params[:user][:password]  
#    @user.password_confirmation = params[:user][:password_confirmation]  
#    if @user.save  
#      flash[:notice] = "Password successfully updated"  
#      redirect_to :controller=>"home"  
#    else  
#      render :action => :edit  
#    end  
end
private

  def load_user_using_perishable_token
    #@user = User.find_using_perishable_token(params[:id])
    @user = User.find_by_id(params[:id])
    unless @user
      flash[:error] = "We're sorry, but we could not locate your account"
      redirect_to root_url
    end
  end

end
