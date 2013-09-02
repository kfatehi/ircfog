require 'spec_helper'

describe ZNC do
  describe ZNC::AdminBot do
    
  end

  it "can add users" do
    ZNC.AdminBot.channels.first.msg "foo"
  end 

  it "can add networks to a user" do
    pending
  end
end


