# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160422192726) do

  create_table "empleados", force: :cascade do |t|
    t.integer  "store_id",          limit: 4
    t.string   "nombre",            limit: 255
    t.string   "direccion",         limit: 255
    t.string   "telefono",          limit: 255
    t.date     "nacimiento"
    t.string   "puesto",            limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "foto_file_name",    limit: 255
    t.string   "foto_content_type", limit: 255
    t.integer  "foto_file_size",    limit: 4
    t.datetime "foto_updated_at"
  end

  add_index "empleados", ["store_id"], name: "index_empleados_on_store_id", using: :btree

  create_table "historia_empleados", force: :cascade do |t|
    t.integer  "empleado_id", limit: 4
    t.string   "titulo",      limit: 255
    t.date     "fecha"
    t.text     "log",         limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id",     limit: 4,     null: false
  end

  add_index "historia_empleados", ["empleado_id"], name: "index_historia_empleados_on_empleado_id", using: :btree

  create_table "historia_tiendas", force: :cascade do |t|
    t.integer  "store_id",   limit: 4
    t.string   "titulo",     limit: 255
    t.date     "fecha"
    t.text     "log",        limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id",    limit: 4,     null: false
  end

  add_index "historia_tiendas", ["store_id"], name: "index_historia_tiendas_on_store_id", using: :btree

  create_table "stores", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "nombre",     limit: 255
    t.string   "direccion",  limit: 255
    t.string   "telefono",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "stores", ["user_id"], name: "index_stores_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "tipo",                   limit: 4
    t.string   "nombre",                 limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "empleados", "stores"
  add_foreign_key "historia_empleados", "empleados"
  add_foreign_key "historia_tiendas", "stores"
  add_foreign_key "stores", "users"
end
