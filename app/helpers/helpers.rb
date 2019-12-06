class Helpers

  def self.current_user(session)
    # id =
User.find(session[:user_id])
  end

  def self.is_logged_in?(session)



  end

end
