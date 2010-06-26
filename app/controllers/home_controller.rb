require 'rubygems'
require 'will_paginate'
class HomeController < ApplicationController
  layout "home"
  before_filter :login_required,:get_month,:check_admin
  #after_filter :copyright ,:except=>:new
  @@per_page = 6
  def autocomplete_user_name
    flag=true
    hr_flag=false
    flag=false if params[:flag] and !params[:flag].empty? and params[:flag]=="false" 
    hr_flag=true if params[:flag] and !params[:flag].empty? and params[:flag]=="hr"
    flag=hr_flag=true if @admin
    @users = User.find( :all,
       :conditions => [ "status=#{flag} and hr_status=#{hr_flag} and LOWER(name) LIKE ?",
          "#{params[:user][:name].downcase}%" ] )
    render :layout=>false 
  end

  def index
    status="status=true and"
    status =" " if params[:flag].to_s=='dob' and @admin
    hr_status=false
    hr_cond="status=true and hr_status=#{hr_status}"
    hr_false="status=false and hr_status=#{hr_status}"
    if @admin
      hr_status=true
      hr_cond="status=true or hr_status=#{hr_status}" 
      hr_false="status=false"
    end
    @sno=1
    @sno=(@@per_page.to_i*params[:page].to_i)-(@@per_page.to_i-1) if params[:page] and params[:page]!=""
    @user=User.find_by_id(session[:user_id])
    if  params[:flag] and params[:flag].to_s=="hr"
      @users=User.paginate :all ,:conditions=>"status=true and hr_status=true" , :order=>"name",:page => params[:page], :per_page => @@per_page
      if params[:user] and params[:user][:name]!=nil
        @users = User.paginate(:all,:conditions => ["status=true and hr_status=true and LOWER(name) like ?", params[:user][:name].downcase + '%'], :order=>"name",:page => params[:page], :per_page => @@per_page)
      end   
    elsif params[:user] and params[:user][:name]!=nil
      @users = User.paginate(:all,:conditions => ["status=true and hr_status=false and LOWER(name) like ?", params[:user][:name].downcase + '%'], :order=>"order_by",:page => params[:page], :per_page => @@per_page)
    elsif  params[:flag] and params[:flag].to_s=='false'
      @users=User.paginate :all ,:conditions=>"#{hr_false}" , :order=>"order_by",:page => params[:page], :per_page => @@per_page
    elsif  params[:flag] and params[:flag].to_s=='dob'
      @users=User.paginate :all ,:conditions=>"#{status} EXTRACT(month from dob)=#{@current_month} and hr_status=#{hr_status}" , :order=>"dob",:page => params[:page], :per_page => @@per_page
    else
      @users=User.paginate :all, :conditions=>"#{hr_cond}", :order=>"order_by" ,:page => params[:page], :per_page => @@per_page
    end
    flash[:notice]="Record not available" if @users and @users.length==0
  end
  
  
  def edit
    @user = User.find_by_id(params[:user_id]) if params[:user_id] != nil
  end
  
  def update
    if params[:user]
      @user = User.find_by_id(params[:user_id]) if params[:user_id] != nil
      if @user.update_attributes(:name=>params[:user][:name],:dob=>params[:user][:dob],:qualification=>params[:user][:qualification],:occupation=>params[:user][:occupation],:relationship=>params[:user][:relationship],:mobile=>params[:user][:mobile],:comment=>params[:user][:comment],
                                 :address=>params[:user][:address],:email=>params[:user][:email],:language_id=>params[:user][:language_id])
      flash[:notice] = "Thank you for updating."
      redirect_to :action=>"index"
      else
         render :action => 'edit',:user_id=>params[:user_id]
      end
    end
  end
  
  def delete
    begin
      flag=false 
      flag=true if params[:flag] and params[:flag]=='false'
    @user=User.find_by_id(params[:user_id])if params[:user_id] != nil
    if @user and @user!=nil
        if @user.update_attribute(:status,flag)
          if @admin
            redirect_to :controller=>"home",:action=>"index"
          else
            redirect_to root_url
          end
          
        end
    end
    rescue Exception => e
    end
  end
  
  def copyright
      response.body=response.body + "<br><center><font color='#000000'><i>prabu ROR developer  (c) 2010</i></font></center>"
    end
end
