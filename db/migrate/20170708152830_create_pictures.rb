class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
    	t.string :title
      t.integer :rating
      t.integer :user_id

      t.timestamps
    end
  end
end
