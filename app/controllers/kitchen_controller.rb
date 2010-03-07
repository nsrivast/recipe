class KitchenController < ApplicationController
  
  def test
    @recipes = Recipe.find(:all)
  end
  
  def home
    @recipes = Recipe.find(:all)
    @top_recipes = @recipes.select{|r| r.parent_id.nil? }
    @operations = Operation.find(:all)
    @groups = Group.find(:all)
    @selected = Recipe.find_by_id(params[:id]) if params[:id]
  end
  
  # ------
  
  def nutrition
    @r = Recipe.find_by_id(params[:id])
    @f = @r.food
  end
  
  def delete_recipe
    r = Recipe.find_by_id(params[:id])
    r.destroy
    redirect_to :controller => 'kitchen', :action => 'home'
  end
  
  def apply_recipe
    child = Recipe.find_by_id(params[:id_child])
    parent = Recipe.find_by_id(params[:id_parent])
    child.parent = parent
    child.save!
    redirect_to :controller => 'kitchen', :action => 'home'
  end
  
  def select_operation
    o = Operation.find(params[:id])
    r = Recipe.new
    r.name = o.name
    r.operation = o
    r.save!
    redirect_to :controller => 'kitchen', :action => 'home'
  end
    
  def select_food
    f = Food.find(params[:id])
    r = Recipe.create(:name => f.desc.downcase)
    r.food = f
    r.save!
    redirect_to :controller => 'kitchen', :action => 'home'
  end
  
  def add_operation
    o = Operation.create(params[:operation])
    redirect_to :controller => 'kitchen', :action => 'home'
  end
end
