class ApplicationController < ActionController::Base
     layout "welcomelayout" 
     protect_from_forgery
  def admin
      unless session[:emp_id]
        flash[:notice] = "You must be logged in"
        redirect_to :controller => "employee",:action => "log"
      end   
     end 

  def authorization
  	if not session[:role]=="HR"
  	   render :template=>"select/error_page",:layout=>"welcomelayout"	
  	end	
  end   
  
 end
