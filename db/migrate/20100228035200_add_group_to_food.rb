class AddGroupToFood < ActiveRecord::Migration
  def self.up
    add_column :foods, :group_id, :integer
  end

  def self.down
  end
end
