class User < ActiveRecord::Base
	has_many :comments, :stories, :comment_upvotes, :story_upvotes
end