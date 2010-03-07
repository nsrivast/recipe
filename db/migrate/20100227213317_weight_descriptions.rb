class WeightDescriptions < ActiveRecord::Migration
  def self.up
    remove_column :foods, :wt_1d
    remove_column :foods, :wt_2d
    
    add_column :foods, :wt_1d, :string
    add_column :foods, :wt_2d, :string
  end

  def self.down
    remove_column :foods, :wt_1d
    remove_column :foods, :wt_2d
    
    add_column :foods, :wt_1d, :decimal
    add_column :foods, :wt_2d, :decimal
  end
end
