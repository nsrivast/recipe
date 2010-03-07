class Recipe < ActiveRecord::Base

  belongs_to :food
  belongs_to :operation
  
  belongs_to :parent, :class_name => "Recipe"
  has_many :children, :class_name => "Recipe", :foreign_key => "parent_id", :order => "name", :dependent => :destroy

#  acts_as_tree :order => "units"
#  acts_as_treemap :label => "title", :size => "units", :color => "roc"
  
end
