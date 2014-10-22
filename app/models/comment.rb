class Comment < ActiveRecord::Base
	belongs_to :users, :stories, :comment_upvotes
end