class CommentUpvote < ActiveRecord::Base
	belongs_to :comments
	belongs_to :users
end