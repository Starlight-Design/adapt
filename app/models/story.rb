class Story < ActiveRecord::Base
	belongs_to :users

	has_many :comments
	has_many :steps
	has_many :story_upvotes

# => Trying to account for RecordNotSaved "You cannot call create
# => unless the parent is saved"
	# after_save :create_steps
end
