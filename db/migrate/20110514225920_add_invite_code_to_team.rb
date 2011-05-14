class AddInviteCodeToTeam < ActiveRecord::Migration
  def self.up
    add_column :teams, :invite_code, :string
  end

  def self.down
    remove_column :teams, :invite_code
  end
end
