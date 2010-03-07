class Food < ActiveRecord::Base
  
  has_many :recipes
  belongs_to :group
  
  def self.hashize(foods)
    h = {}
    for food in foods
      fs = food.desc.downcase.split(',')
      h = Food.construct_hash(h, fs, food.id)
    end
    h = Food.clean_hash(h)
    h = Food.clean_hash(h)
    h = Food.clean_hash(h)
    h = Food.clean_hash(h)
    return h
  end
  
  def self.construct_hash(h, fs, i)
    while not fs.empty?
      f = fs.shift
      h[f] = {} if not h.has_key?(f)
      if fs.empty?
        h[f] = {'' => i}
      else
        h[f] = Food.construct_hash(h[f], fs, i)
      end
    end
    return h
  end
  
  def self.clean_hash(h)
    for k in h.keys
      if h[k].is_a?(Hash) && h[k].length == 1
        new_val = h[k].values[0]
        new_key = h[k].keys[0]
        h.delete(k)
        h[k + ', ' + new_key] = new_val
      elsif h[k].is_a?(Hash)
        h[k] = Food.clean_hash(h[k])
      end
    end
    return h
  end
end
