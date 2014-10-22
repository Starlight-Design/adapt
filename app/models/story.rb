class Story < ActiveRecord::Base
	belongs_to :users
	has_many :comments, :steps, :story_upvotes
end
