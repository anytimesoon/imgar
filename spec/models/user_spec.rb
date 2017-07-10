require 'rails_helper'

RSpec.describe User, type: :model do

  describe "associations: " do

	  it "has many pictures" do
	  	t = User.reflect_on_association(:pictures)
    	expect(t.macro).to eq(:has_many)
	  end

	  it "has many comments" do
	  	t = User.reflect_on_association(:comments)
    	expect(t.macro).to eq(:has_many)
	  end

	end

	describe "validations: " do

		it "is invalid without a name" do
			@user = User.new
			expect(@user.save).to be_falsey
		end

	end

end
