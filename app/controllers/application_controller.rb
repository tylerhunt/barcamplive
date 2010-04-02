class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery

  def verify_access
    authenticate_or_request_with_http_basic('Admin') do |username, password|
      username == 'admin' && password == 'wallstreet'
    end
  end
  protected :verify_access
end
