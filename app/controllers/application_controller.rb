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
    # If there is a match, set the session to the user's ID,
    # redirect them to the /account route (using redirect to),
    # and use ERB to display the user's data on the page.
    if @user
          session[:user_id] = @user.id
          redirect to '/account'
        end
    # If there is no match, render the error page.
    erb :error
  end

  get '/account' do
    erb :error
    # erb :account
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end
