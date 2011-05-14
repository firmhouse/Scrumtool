class DefaultEmailToNullForUser < ActiveRecord::Migration
  def self.up
    change_column :users, :email, :string, :null => true
    change_column_default :users, :email, nil
  end

  def self.down
    change_column :users, :email, :string
    change_column_default :users, :email, ""
  end
end