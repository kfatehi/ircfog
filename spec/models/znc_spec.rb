require 'spec_helper'

describe ZNC do
  before do
    @user = FactoryGirl.create(:user)
  end

  it "can add users" do
    ZNC.add_user @user
    users = ZNC.list_users
    users.should have(1).item
    users.should include @user.znc_username
  end 

  it "can add networks to a user" do
    pending
  end
end


