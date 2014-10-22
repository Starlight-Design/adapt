class CommentUpvote < ActiveRecord::Base
	belongs_to :comments, :users
end