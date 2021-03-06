class AddTables < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :user_name
      t.string :email
  		t.string :password
  		t.timestamps
  	end
  	create_table :stories do |t|
      t.string :title
  		t.string :body
      t.integer :user_id
  		t.integer :story_id
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
      t.string :step_text
      t.integer :story_id
      t.integer :order_id
  		t.timestamps
  		# Maybe come back and add a photo field - if we have time.
  	end
    create_table :stories_users do |t|
      t.integer :story_id
      t.integer :user_id
      t.integer :current_step
      t.timestamps
    end
  end
end