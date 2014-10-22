# Homepage (Root path)
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

# takes username and password from the signin form and check against the User table to find that unique combination. If its found (i.e. != [] which means not and empty array) then it takes us to the tracks page otherwise it takes us back to the login page again.
post '/login' do
  username = params[:username]
  pw = params[:password]
  user = User.where(username: username, password: password)

  if user != []
    session[:username] = username
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

get '/signup' do
  erb :signup
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
