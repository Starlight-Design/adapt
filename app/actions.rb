# Homepage (Root path)
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
end