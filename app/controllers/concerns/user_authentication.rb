module UserAuthentication
  extend ActiveSupport::Concern
  
  included do 
  	helper_method :current_user 
  	helper_method :signed_in?
  	helper_method :authenticate_user!
  end

  def signed_in?
  	session[:user_id] != nil 			
  end

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end  

  def authenticate_user!
  	redirect_to log_in_path, :notice => "You need to sign in before continue" unless signed_in?
  end 
end 