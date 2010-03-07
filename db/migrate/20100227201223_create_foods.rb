class CreateFoods < ActiveRecord::Migration
  def self.up
    create_table :foods do |t|
      t.integer :NDB
      t.string :desc
      t.decimal :water, :kcal, :prot, :lipid, :ash, :carb, :fiber, :sugar
      t.decimal :ca, :fe, :mg, :p, :k, :na, :zn, :cu, :mn, :se, :v_c, :v_b1, :v_b2, :v_b3, :v_b4, :v_b6
      t.decimal :fol, :fol_a, :fol_f, :fol_d, :chol, :v_b12, :vit_a, :vit_a_r, :ret, :carot_a, :carot_b, :crypt_b
      t.decimal :lyco, :lut, :v_e, :v_d_m, :v_d_iu, :v_k, :fa_sat, :fa_mono, :fa_poly, :chol
      t.decimal :wt_1, :wt_1d, :wt_2, :wt_2d, :ref
      
      t.timestamps
    end
  end

  def self.down
    drop_table :foods
  end
end
