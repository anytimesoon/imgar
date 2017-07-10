require 'rails_helper'

RSpec.describe Tag, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "associations: " do
  	it "belongs to a picture" do
	  	t = Tag.reflect_on_association(:pictures)
    	expect(t.macro).to eq(:has_many)
  	end
  end

  describe "validations: " do
  	it "has a name" do
  		@tag = Tag.new
  		expect(@tag.save).to be_false
  	end
  end
end
