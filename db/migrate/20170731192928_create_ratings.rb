class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
    	t.integer :value, default: 100
    	t.integer :total_votes, default: 1
    	t.integer :user_id
    	t.integer :picture_id

      t.timestamps
    end
  end
end
