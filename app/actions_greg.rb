### This file needs to be merged manually with actions.rb

get '/stories' do
  @stories = Story.all
  erb :'stories/index'
end