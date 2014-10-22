class StoryUpvotes < ActiveRecord::Base
	belongs_to :users
	belongs_to :stories
end