in actions.rb

##VER 1 RESTRICTS USER TO ONE UPVOTE PER STORY
# post '/stories/:story_id/upvotes' do
#   story = Story.find params[:story_id]
#   user = User.find params[:story_id]
#   upvote_exist = StoryUpvote.find_by story_id: story.id, user_id: user.id

#   if upvote_exist == nil
#     StoryUpvote.create story_id: story.id, user_id: user.id
#   end

#   redirect '/stories'
# end


##VER 2 NO RESTRICTIONS ON UPVOTES
post '/stories/:story_id/upvotes' do
  story = Story.find params[:story_id]
  user = User.find params[:story_id]
  StoryUpvote.create story_id: story.id, user_id: user.id
  redirect '/stories'
end


in stories/index.erb

<p>
  <form action="/stories/<%= story.id %>/upvotes" method="post">
    <input type='submit' value='I Like This'> (<%= story.story_upvotes.count %> votes) 
  </form>
</p>


in models/story_upvote.rb

class StoryUpvote < ActiveRecord::Base
  belongs_to :users
  belongs_to :stories
end
