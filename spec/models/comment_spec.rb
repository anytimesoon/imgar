require 'rails_helper'

RSpec.describe Comment, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "associations: " do
  	it "belongs to a user" do
	  	t = Comment.reflect_on_association(:users)
    	expect(t.macro).to eq(:belongs_to)
  	end

  	it "has many comments" do
  		t = Comment.reflect_on_association(:pictures)
    	expect(t.macro).to eq(:belongs_to)
  	end
  end

  describe "validations: " do
  	it "has content" do
  		@comment = Comment.new
  		expect(@comment.save).to be_false
  	end
  end
end
