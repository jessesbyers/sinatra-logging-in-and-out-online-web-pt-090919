class Helpers

  def self.current_user(session)
    User.find(session[:user_id])
  end

  def self.is_logged_in?(session)
    session.include?(session[:user_id])
  end

# return true if the user_id is in the session hash and false if not.
# The Ruby !! operator will come in handy here.

end
