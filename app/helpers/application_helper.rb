module ApplicationHelper

  def current_user
    @user ||= User.find_by_id(session[:id])
  end

  def show_nav_bar_login?
    !current_page?(new_user_path)
  end
end
