# Homepage (Root path)

use Rack::Logger

enable :sessions

helpers do
  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

get '/' do
  erb :index
end


get '/login' do
  erb :login
end


post '/login' do
  username = params[:user_name]
  password = params[:password]
  user = User.where(user_name: username, password: password).first

  if user != nil
    session[:user_id] = user.id

    redirect '/stories'
  else
    redirect '/login'
  end

end

# get '/user_sessions/new' do
#   erb :index
# end

# post '/user_sessions/new' do
 
# end

# get '/stories' do
#   erb :index
# end

# get '/stories/new' do
# end

# get '/comments/new' do
# end

# get '/users' do
# end

# get '/users/new' do
# end


get '/register' do
  erb :register
end

post '/register' do
  user = User.create(user_name: params[:user_name], email: params[:email], password: params[:password])
  if user
    session[:user_id] = user.id
    redirect '/stories'
  else
    redirect '/register'
  end
end


get '/logout' do
  session.clear
  redirect '/'
end
