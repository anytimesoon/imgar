require 'rails_helper'

RSpec.describe User, type: :model do
  # before(:each) do
  # 	@user = User.create()
  # end

  it "has many pictures" do
  	expect(@user.pictures.count).to eq(5)
  end

end
