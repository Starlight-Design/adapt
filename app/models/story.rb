class Story < ActiveRecord::Base
	belongs_to :users
	has_many :comments
	has_many :steps
	has_many :story_upvotes
	# has_many :story_downvotes

 #  def upvote
 #    self.score += 1
 #    self.save
 #  end

 #  def downvote
 #    self.score -= 1
 #    self.save
 #  end
end
