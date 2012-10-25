module ApplicationHelper
  def admin?
    session[:admin]
  end
end
