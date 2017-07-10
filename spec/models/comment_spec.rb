require 'rails_helper'

RSpec.describe Comment, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "associations: " do
  	it "belongs to a user" do
	  	t = Comment.reflect_on_association(:user)
	  	# binding.pry
    	expect(t.macro).to eq(:belongs_to)
  	end

  	it "belongs to a picture" do
  		t = Comment.reflect_on_association(:picture)
    	expect(t.macro).to eq(:belongs_to)
  	end
  end

  describe "validations: " do
  	it "has content" do
  		@comment = Comment.new
  		expect(@comment.save).to be_falsey
  	end
  end
end
