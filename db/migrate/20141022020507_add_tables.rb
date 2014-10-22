class AddTables < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :user_name
  		t.string :password
  		t.timestamps
  	end
  	create_table :stories do |t|
  		t.integer :user_id
  		t.string :story
  		t.integer :forked_from_id
  		t.timestamps
  	end
  	create_table :comments do |t|
  		t.string :comment
  		t.integer :user_id
  		t.integer :story_id
  		t.timestamps
  	end
  	create_table :story_upvotes do |t|
  		t.integer :user_id
  		t.integer :story_id
  		t.timestamps
  	end
  	create_table :comment_upvotes do |t|
  		t.integer :user_id
  		t.integer :comment_id
  		t.timestamps
  	end
  	create_table :steps do |t|
  		t.integer :story_id
  		t.string :step_text
  		t.timestamps
  		# Maybe come back and add a photo field - if we have time.
  	end
  end
end