class AddTwitterScreenNameToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :twitter_screen_name, :string
  end

  def self.down
    remove_column :users, :twitter_screen_name
  end
end
