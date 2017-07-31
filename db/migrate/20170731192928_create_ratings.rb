class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
    	t.integer :value
    	t.integer :total_votes
    	t.integer :user_id
    	t.integer :picture_id

      t.timestamps
    end
  end
end
