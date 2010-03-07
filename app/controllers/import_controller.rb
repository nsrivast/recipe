require 'csv'

class ImportController < ApplicationController
  
  def destroy_all
    Food.destroy_all()
    Group.destroy_all()
    Operation.destroy_all()
    Recipe.destroy_all()
    
    redirect_to :controller => 'kitchen', :action => 'home'
  end
  
  def import_all
    import_foods('')
    import_groups('')
    assign_groups('')
    create_operations
    
    redirect_to :controller => 'kitchen', :action => 'home'
  end
  
  def import_abbr
    import_foods('_abbr')
    import_groups('_abbr')
    assign_groups('_abbr')
    create_operations
    
    redirect_to :controller => 'kitchen', :action => 'home'
  end
  
  def import_foods(suffix)
    fields = %w[NDB desc water kcal prot lipid ash carb fiber sugar ca fe mg p k na zn cu mn se v_c v_b1 v_b2 v_b3 v_b4 v_b6 fol fol_a fol_f fol_d chol v_b12 vit_a vit_a_r ret carot_a carot_b crypt_b lyco lut v_e v_d_m v_d_iu v_k fa_sat fa_mono fa_poly chol wt_1 wt_1d wt_2 wt_2d ref]
    foods = []
    CSV.open('public/FOODS' + suffix + '.txt', 'r') do |row|
      food = {}
      fields.each_with_index{ |field, i| food[field] = row[i] }
      foods << food
    end  
    Food.create!(foods)
  end
  
  def import_groups(suffix)
    fields = %w[gpid name]
    groups = []
    CSV.open('public/GROUPS' + suffix + '.txt', 'r') do |row|
      group = {}
      fields.each_with_index{ |field, i| group[field] = row[i] }
      groups << group
    end
    Group.create!(groups)
  end
  
  def assign_groups(suffix)
    group_map = Group.find(:all).map{|g| [g.gpid, g.id] }.inject({}) {|h, (k,v)| h[k]=v; h}

    CSV.open('public/FOODS_GROUPS' + suffix + '.txt', 'r') do |row|
      f = Food.find_by_NDB(row[0])
      if !f.nil? 
        f.group_id = group_map[row[1].to_i]
        f.desc = row[2]
        f.save!
      end
    end
  end
  
  def create_operations
    ops = []
    %w[bake fry boil blend mix chop].each{ |op| ops << {:name => op} }
    Operation.create!(ops)
  end
end
