class AddTwitterUidToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :twitter_uid, :string
  end

  def self.down
    remove_column :users, :twitter_uid
  end
end
