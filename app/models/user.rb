class User < ActiveRecord::Base
	has_many :comments 
	has_many :stories
	has_many :comment_upvotes
	has_many :story_upvotes
end