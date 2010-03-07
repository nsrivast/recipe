class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.string :name
      t.integer :food_id, :operation_id, :parent_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :recipes
  end
end
