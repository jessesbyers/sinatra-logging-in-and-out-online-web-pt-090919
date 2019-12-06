require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect to '/account'
    end
      erb :error
  end

  get '/account' do
    if Helpers.user_logged_in?(session) == false
      erb :error
    else
      erb :account

    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end
