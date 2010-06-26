require 'rubygems'
class UsersController < ApplicationController
 
  def new
    @user = User.new
  end
  
  def create
    hr_status=false
    puts params[:user].inspect
    puts params.inspect
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      if params[:user][:gender]=='male'
          gender=true
      else
          gender=false
      end
       hr_status=true if params[:user][:hr_status]=='yes'
      puts hr_status
      if params[:user][:dob]!=nil
        cyear=Time.now.year
        byear=params[:user][:dob].to_date.strftime("%Y").to_i
        age=cyear-byear
      end
      
      @user=User.find_by_id(@user.id)
      if hr_status
        puts "enter"
        if @user.update_attributes(:name=>params[:user][:name],:dob=>params[:user][:dob],:age=>age,:gender=>gender, :mobile=>params[:user][:mobile], :company=>params[:user][:company],:hr_status=>hr_status,:role=>"hr",:relationship=>"HR",:occupation=>"HR Dept.")
          flash[:notice] = "Thank you for signing up! You are now logged in."
          redirect_to :controller=>"hrs"
        end
      else
        puts "not hr"
          if @user.update_attributes(:name=>params[:user][:name],:dob=>params[:user][:dob],:age=>age,:gender=>gender,:qualification=>params[:user][:qualification],:occupation=>params[:user][:occupation],:relationship=>params[:user][:relationship], :mobile=>params[:user][:mobile], :address=>params[:user][:address])
          flash[:notice] = "Thank you for signing up! You are now logged in."
          redirect_to :controller=>"home"
          end
        end
    else
      render :action => 'new'
    end
  end
end
