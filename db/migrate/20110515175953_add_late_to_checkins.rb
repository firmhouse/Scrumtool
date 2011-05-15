class AddLateToCheckins < ActiveRecord::Migration
  def self.up
    add_column :checkins, :late, :boolean
  end

  def self.down
    remove_column :checkins, :late
  end
end
