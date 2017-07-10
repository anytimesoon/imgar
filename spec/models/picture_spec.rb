require 'rails_helper'

RSpec.describe Picture, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "associations: " do
  	it "belongs to a user" do
	  	t = Picture.reflect_on_association(:user)
    	expect(t.macro).to eq(:belongs_to)
  	end

  	it "has many comments" do
  		t = Picture.reflect_on_association(:comment)
    	expect(t.macro).to eq(:has_many)
  	end

  	it "has many tags" do
  		t = Picture.reflect_on_association(:tag)
    	expect(t.macro).to eq(:has_many)
  	end
  end

  describe "validations: " do
  	it "has a path" do
  		@picture = Picture.new
  		expect(@picture.save).to be_falsey
  	end
  end
end
