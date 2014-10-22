class Story < ActiveRecord::Base
	belongs_to :users
	has_many :comments
	has_many :steps
	has_many :story_upvotes
end
