# Homepage (Root path)

use Rack::Logger

enable :sessions

helpers do
  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

# helpers do
#   def is_original_poster?
#     is_original_poster ||= Story.find(session[:user_id]) if session[:user_id]
#   end
# end

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

get '/stories' do
  @stories = Story.all
  erb :'stories/index'
end

post '/stories' do
  @stories = Story.new(
    title:   params[:title],
    body:    params[:body]
  )
  i=1
  params[:num_steps].to_i.times do
    x = "step_text_#{i}"
    y = x.to_sym
        # binding.pry
    @stories.steps << Step.create(step_text: params[y], order_id: i)    
    i+=1
  end  
  if @stories.save
    redirect '/stories'
  else
    erb :'stories/new'
  end
end



  # #do loop for number of steps params[:num_steps].to_i
  #   x = ":step_text_#{i}"
  #   y = x.to_sym
  #   i+=1;
  # #

  #   @stories.steps.new(step_text: params[y], order_id: i)
  # #########




get '/stories/new' do
  if current_user
    erb :'stories/new'
  else
    redirect '/'
  end
end

#################################
  # x = Story.find(1)
  # x.steps.where(order_id: 2)
#################################

get '/stories/:id' do
  @story = Story.find params[:id] 
  # binding.pry
  @step_id = 0
  # @step = Story.steps params[:id]   
  #  binding.pry
  erb :'stories/show'
end

get '/stories/:id/step/:step_id' do
  @story = Story.find params[:id]
  @step_id = params[:step_id].to_i
  erb :'stories/show'
end

# post '/story/:id/upvote' do
#   Story.find(params[:id]).upvote
#   redirect :'/stories'
# end

# post '/story/:id/downvote' do
#   Story.find(params[:id]).downvote
#   redirect :'stories'
# end

# post '/stories/:story_id/upvotes' do
#   if current_user
#     @story = Story.find(params[:story_id])
#     @story.upvotes ||= 0
#     @story.upvotes += 1
#     @story.save
#     redirect '/stories'
#   else
#     redirect '/'
#   end
# end
# post '/stories' do
#   if current_user
#     @story = Story.new(
#       title:   params[:title],
#       body:    params[:body],
#     )
#       if @story.save
#         redirect '/stories'
#       else
#         erb :'stories/new'
#       end
#   end
# end
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