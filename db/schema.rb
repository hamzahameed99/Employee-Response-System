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

ActiveRecord::Schema.define(version: 2021_11_05_133644) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evaluation_forms", force: :cascade do |t|
    t.text "comment"
    t.string "submit_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "users_id"
    t.bigint "user_id", null: false
    t.string "answer1"
    t.string "answer2"
    t.string "answer3"
    t.string "answer4"
    t.string "answer5"
    t.string "answer6"
    t.string "answer7"
    t.string "answer8"
    t.string "answer9"
    t.string "answer10"
    t.index ["user_id"], name: "index_evaluation_forms_on_user_id"
    t.index ["users_id"], name: "index_evaluation_forms_on_users_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "question"
    t.text "answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "cnic"
    t.string "email"
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.date "join_date"
    t.integer "managerid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "evaluation_forms", "users"
end
