require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    # binding.pry
    if Helpers.is_logged_in?(session)
      redirect "/missions"
    end
    erb :index
  end

end
