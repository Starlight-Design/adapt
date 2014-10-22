class StoryUpvotes < ActiveRecord::Base
	belongs_to :users, :stories
end