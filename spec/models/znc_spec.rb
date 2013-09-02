require 'spec_helper'
require 'pry'


describe ZNC do
    
  before do
    @user = FactoryGirl.create(:user)
  end

  describe "#status" do
    it "returns the znc status interface user" do
      subject.status.nick.should eq "*status"
    end
  end

  describe "#admin" do
    it "returns the znc admin interface user" do
      subject.admin.nick.should eq "*admin"
    end
  end

  describe "#list_users" do
    it "responds with ListUsers table" do
      reply = ZNC.list_users.map(&:message).join("\n")
      reply.should include "Username"
    end
  end

  describe "#users" do
    it "returns the Ircfog users in the ZNC config" do
      ZNC.users.should be_empty
    end
  end

  it "can add users" do
    ZNC.add_user @user
    ZNC.users.should eq [@user.znc_username]
  end 

  it "can add networks to a user" do
    pending
  end
end


