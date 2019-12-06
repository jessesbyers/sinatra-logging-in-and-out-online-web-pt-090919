class Helpers

  def self.current_user(session)
    # id = 
    user = User.find(session[:user_id])
    user
  end

  def self.is_logged_in?(session)



  end

end
