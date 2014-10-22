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
  erb :signin
end

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