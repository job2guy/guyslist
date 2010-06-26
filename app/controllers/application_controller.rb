# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
require 'rubygems'
class ApplicationController < ActionController::Base
  include Authentication
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  # Scrub sensitive parameters from your log
   filter_parameter_logging :password , :password_confirmation
   
    def authorize
      unless session[:user_id]
        flash[:notice] = "Please log in"
        redirect_to(:controller => "sessions", :action => "new")
      end
    end
    
    def get_month
      time=Time.now()
      @current_month=time.strftime("%m")
    end
    
    def check_admin
      @admin=false
      if current_user.name=='prabu' and current_user.role=='admin'
        @admin=true
      end
    end
end
