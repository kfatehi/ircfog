class AddZncUsernameToUser < ActiveRecord::Migration
  def change
    add_column :users, :znc_username, :string
  end
end
