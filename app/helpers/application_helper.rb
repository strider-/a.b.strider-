module ApplicationHelper
  
  def current_user?(user)
    user == current_user
  end  

  def current_user
    User.find(session[:user_id]) unless session[:user_id].nil?
  end

  def authenticated?
    true unless session[:user_id].nil?
  end

  def personal_links
    PersonalLink.all
  end

  def latest_activity     
    Commit.latest 5
  end
end
