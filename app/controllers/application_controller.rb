class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # :secret => '899abf093c3f8f06fc8860c27936a25b'

  def login
    verify_access and redirect_to(admin_venues_path)
  end

  def logout
    session[:admin] = false
    redirect_to root_path
  end

  def verify_access
    authenticate_or_request_with_http_basic("Admin") do |username, password|
      username == 'admin' && password == 'wallstreet' && session[:admin] = true
    end
  end
  protected :verify_access
end
