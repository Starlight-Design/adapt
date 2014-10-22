# Homepage (Root path)
get '/' do
  erb :index
end

get '/user_sessions/new' do
  erb :index
end

post '/user_sessions/new' do
  username = params[:username]
  pw = params[:password]
  user = User.where(username: username, password: pw)

  if user != []
    session[:username] = username
    redirect '/stories'
  else
    redirect '/login'
  end
end

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



