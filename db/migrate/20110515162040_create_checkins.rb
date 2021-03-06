class CreateCheckins < ActiveRecord::Migration
  def self.up
    create_table :checkins do |t|
      t.belongs_to :user
      t.date :checked_in_on
      t.timestamps
    end
  end

  def self.down
    drop_table :checkins
  end
end
