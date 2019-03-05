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
    @user=User.new(name: params["name"], password: params["password"])
    @user.save
    session[:user_id] = @user.id
  end

  get '/account' do

  end

  get '/logout' do
    redirect to '/'
  end


end
