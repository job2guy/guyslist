require 'rubygems'
class HrsController < ApplicationController
  before_filter :login_required
  
  def index
    begin
      puts params.inspect
    puts "index"
    @languages=[]
    @languages=Language.find(:all,:order=>"name")
    @user=User.find_by_id(session[:user_id])
    params[:language][:id]="" if params[:language] and params[:language][:id]!=nil and params[:language][:id]!="" and params[:language][:id]=='-999'
    if params[:language] and params[:language][:id]!=nil and params[:language][:id]!=""
      puts "enter"
      @language=Language.find_by_id(params[:language][:id])
      @users = User.find(:all ,:conditions=>["status=true and hr_status=false and language_id=?", params[:language][:id]], :order=>"order_by")
    elsif  params[:flag] and params[:flag].to_s=='home'
      @users=User.find(:all , :conditions=>"status=true and hr_status=false" , :order=>"order_by")
    else
      @users=User.find(:all, :conditions=>"status=true and hr_status=false", :order=>"order_by" )
    end
    flash[:notice]="Record not available" if @users and @users.length==0
    rescue Exception => e
      puts e
    end
    
  end
end
