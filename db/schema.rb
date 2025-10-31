# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2025_10_31_040656) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "permissions", force: :cascade do |t|
    t.string "category", limit: 50, null: false
    t.datetime "created_at", null: false
    t.text "description"
    t.string "display_name", limit: 150, null: false
    t.string "name", limit: 100, null: false
    t.datetime "updated_at", null: false
    t.index ["category"], name: "index_permissions_on_category"
    t.index ["name"], name: "index_permissions_on_name", unique: true
  end

  create_table "role_permissions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "permission_id", null: false
    t.bigint "role_id", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_id"], name: "index_role_permissions_on_permission_id"
    t.index ["role_id"], name: "index_role_permissions_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "display_name", limit: 100, null: false
    t.boolean "is_system_role", default: false, null: false
    t.string "name", limit: 50, null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "assigner_id", null: false
    t.datetime "created_at", null: false
    t.bigint "role_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["assigner_id"], name: "index_user_roles_on_assigner_id"
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "all_ips", limit: 45, array: true
    t.datetime "birthday"
    t.datetime "created_at", null: false
    t.string "email", limit: 120, null: false
    t.string "first_name", limit: 50
    t.string "hackatime_api_key", limit: 255
    t.boolean "hide_email", default: false, null: false
    t.string "identity_token", limit: 500
    t.boolean "identity_verified", default: false, null: false
    t.boolean "is_suspended", default: false, null: false
    t.datetime "last_login"
    t.string "last_login_ip", limit: 45
    t.string "last_name", limit: 50
    t.string "password_hash", limit: 255, null: false
    t.string "registration_ip", limit: 45
    t.boolean "show_alias", default: false, null: false
    t.string "slack_user_id", limit: 255
    t.datetime "updated_at", null: false
    t.string "username", limit: 80, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "role_permissions", "permissions"
  add_foreign_key "role_permissions", "roles"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
  add_foreign_key "user_roles", "users", column: "assigner_id"
end
