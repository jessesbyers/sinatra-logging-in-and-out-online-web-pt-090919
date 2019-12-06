class Helpers

  def self.current_user(session)
    user = User.find_by(session[:user_id])
  end

  def is_logged_in?

  end

end
