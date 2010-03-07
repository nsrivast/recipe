# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100228035200) do

  create_table "foods", :force => true do |t|
    t.integer  "NDB"
    t.string   "desc"
    t.decimal  "water"
    t.decimal  "kcal"
    t.decimal  "prot"
    t.decimal  "lipid"
    t.decimal  "ash"
    t.decimal  "carb"
    t.decimal  "fiber"
    t.decimal  "sugar"
    t.decimal  "ca"
    t.decimal  "fe"
    t.decimal  "mg"
    t.decimal  "p"
    t.decimal  "k"
    t.decimal  "na"
    t.decimal  "zn"
    t.decimal  "cu"
    t.decimal  "mn"
    t.decimal  "se"
    t.decimal  "v_c"
    t.decimal  "v_b1"
    t.decimal  "v_b2"
    t.decimal  "v_b3"
    t.decimal  "v_b4"
    t.decimal  "v_b6"
    t.decimal  "fol"
    t.decimal  "fol_a"
    t.decimal  "fol_f"
    t.decimal  "fol_d"
    t.decimal  "chol"
    t.decimal  "v_b12"
    t.decimal  "vit_a"
    t.decimal  "vit_a_r"
    t.decimal  "ret"
    t.decimal  "carot_a"
    t.decimal  "carot_b"
    t.decimal  "crypt_b"
    t.decimal  "lyco"
    t.decimal  "lut"
    t.decimal  "v_e"
    t.decimal  "v_d_m"
    t.decimal  "v_d_iu"
    t.decimal  "v_k"
    t.decimal  "fa_sat"
    t.decimal  "fa_mono"
    t.decimal  "fa_poly"
    t.decimal  "wt_1"
    t.decimal  "wt_2"
    t.decimal  "ref"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "wt_1d"
    t.string   "wt_2d"
    t.integer  "group_id"
  end

  create_table "groups", :force => true do |t|
    t.integer  "gpid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operations", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", :force => true do |t|
    t.string   "name"
    t.integer  "food_id"
    t.integer  "operation_id"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
