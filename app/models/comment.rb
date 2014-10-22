class Comment < ActiveRecord::Base
	belongs_to :users
	belongs_to :stories
	belongs_to :comment_upvotes
end