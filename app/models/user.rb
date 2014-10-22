class User < ActiveRecord::Base
	belongs_to :admins
	has_many :comments 
	has_many :stories
	has_many :comment_upvotes
	has_many :story_upvotes

	validates :user_name, :email, :password, presence: true
end	