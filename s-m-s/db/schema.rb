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

ActiveRecord::Schema[7.0].define(version: 2023_10_19_202921) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apis_classroom", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.index ["teacher_id"], name: "apis_classroom_teacher_id_c540c87b"
  end

  create_table "apis_classroom_students", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "classroom_id", null: false
    t.bigint "customuser_id", null: false
    t.index ["classroom_id", "customuser_id"], name: "apis_classroom_students_classroom_id_customuser__171bdaf0_uniq", unique: true
    t.index ["classroom_id"], name: "apis_classroom_students_classroom_id_a1463025"
    t.index ["customuser_id"], name: "apis_classroom_students_customuser_id_f542fe9f"
  end

  create_table "apis_subject", id: :bigint, default: nil, force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.index ["name"], name: "apis_subject_name_ff01d3f3_like", opclass: :varchar_pattern_ops
    t.index ["name"], name: "apis_subject_name_key", unique: true
  end

  create_table "apis_subject_students", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "subject_id", null: false
    t.bigint "customuser_id", null: false
    t.index ["customuser_id"], name: "apis_subject_students_customuser_id_8bf823d1"
    t.index ["subject_id", "customuser_id"], name: "apis_subject_students_subject_id_customuser_id_d3ab5d9d_uniq", unique: true
    t.index ["subject_id"], name: "apis_subject_students_subject_id_32c4d441"
  end

  create_table "apis_subject_teachers", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "subject_id", null: false
    t.bigint "customuser_id", null: false
    t.index ["customuser_id"], name: "apis_subject_teachers_customuser_id_c2e85181"
    t.index ["subject_id", "customuser_id"], name: "apis_subject_teachers_subject_id_customuser_id_2cb96b0c_uniq", unique: true
    t.index ["subject_id"], name: "apis_subject_teachers_subject_id_1d0c947c"
  end

  create_table "apis_timetable", id: :bigint, default: nil, force: :cascade do |t|
    t.string "title", limit: 100, null: false
    t.text "description", null: false
    t.timestamptz "schedule", null: false
    t.bigint "teacher_id", null: false
    t.index ["teacher_id"], name: "apis_timetable_teacher_id_6aa77691"
  end

  create_table "auth_group", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 150, null: false
    t.index ["name"], name: "auth_group_name_a6ea08ec_like", opclass: :varchar_pattern_ops
    t.index ["name"], name: "auth_group_name_key", unique: true
  end

  create_table "auth_group_permissions", id: :bigint, default: nil, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "permission_id", null: false
    t.index ["group_id", "permission_id"], name: "auth_group_permissions_group_id_permission_id_0cd325b0_uniq", unique: true
    t.index ["group_id"], name: "auth_group_permissions_group_id_b120cbf9"
    t.index ["permission_id"], name: "auth_group_permissions_permission_id_84c5c92e"
  end

  create_table "auth_permission", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "content_type_id", null: false
    t.string "codename", limit: 100, null: false
    t.index ["content_type_id", "codename"], name: "auth_permission_content_type_id_codename_01ab375a_uniq", unique: true
    t.index ["content_type_id"], name: "auth_permission_content_type_id_2f476e4b"
  end

  create_table "classrooms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "core_customuser", id: :bigint, default: nil, force: :cascade do |t|
    t.string "password", limit: 128, null: false
    t.timestamptz "last_login"
    t.boolean "is_superuser", null: false
    t.string "username", limit: 150, null: false
    t.string "first_name", limit: 150, null: false
    t.string "last_name", limit: 150, null: false
    t.string "email", limit: 254, null: false
    t.boolean "is_staff", null: false
    t.boolean "is_active", null: false
    t.timestamptz "date_joined", null: false
    t.string "user_type", limit: 10, null: false
    t.index ["username"], name: "core_customuser_username_0e60666f_like", opclass: :varchar_pattern_ops
    t.index ["username"], name: "core_customuser_username_key", unique: true
  end

  create_table "core_customuser_groups", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "customuser_id", null: false
    t.integer "group_id", null: false
    t.index ["customuser_id", "group_id"], name: "core_customuser_groups_customuser_id_group_id_7990e9c6_uniq", unique: true
    t.index ["customuser_id"], name: "core_customuser_groups_customuser_id_976bc4d7"
    t.index ["group_id"], name: "core_customuser_groups_group_id_301aeff4"
  end

  create_table "core_customuser_user_permissions", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "customuser_id", null: false
    t.integer "permission_id", null: false
    t.index ["customuser_id", "permission_id"], name: "core_customuser_user_per_customuser_id_permission_49ea742a_uniq", unique: true
    t.index ["customuser_id"], name: "core_customuser_user_permissions_customuser_id_ebd2ce6c"
    t.index ["permission_id"], name: "core_customuser_user_permissions_permission_id_80ceaab9"
  end

  create_table "django_admin_log", id: :integer, default: nil, force: :cascade do |t|
    t.timestamptz "action_time", null: false
    t.text "object_id"
    t.string "object_repr", limit: 200, null: false
    t.integer "action_flag", limit: 2, null: false
    t.text "change_message", null: false
    t.integer "content_type_id"
    t.bigint "user_id", null: false
    t.index ["content_type_id"], name: "django_admin_log_content_type_id_c4bce8eb"
    t.index ["user_id"], name: "django_admin_log_user_id_c564eba6"
    t.check_constraint "action_flag >= 0", name: "django_admin_log_action_flag_check"
  end

  create_table "django_content_type", id: :integer, default: nil, force: :cascade do |t|
    t.string "app_label", limit: 100, null: false
    t.string "model", limit: 100, null: false
    t.index ["app_label", "model"], name: "django_content_type_app_label_model_76bd3d3b_uniq", unique: true
  end

  create_table "django_migrations", id: :bigint, default: nil, force: :cascade do |t|
    t.string "app", limit: 255, null: false
    t.string "name", limit: 255, null: false
    t.timestamptz "applied", null: false
  end

  create_table "django_session", primary_key: "session_key", id: { type: :string, limit: 40 }, force: :cascade do |t|
    t.text "session_data", null: false
    t.timestamptz "expire_date", null: false
    t.index ["expire_date"], name: "django_session_expire_date_a5c62663"
    t.index ["session_key"], name: "django_session_session_key_c0390e0f_like", opclass: :varchar_pattern_ops
  end

  create_table "subjects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_tables", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "apis_classroom", "core_customuser", column: "teacher_id", name: "apis_classroom_teacher_id_c540c87b_fk_core_customuser_id", deferrable: :deferred
  add_foreign_key "apis_classroom_students", "apis_classroom", column: "classroom_id", name: "apis_classroom_stude_classroom_id_a1463025_fk_apis_clas", deferrable: :deferred
  add_foreign_key "apis_classroom_students", "core_customuser", column: "customuser_id", name: "apis_classroom_stude_customuser_id_f542fe9f_fk_core_cust", deferrable: :deferred
  add_foreign_key "apis_subject_students", "apis_subject", column: "subject_id", name: "apis_subject_students_subject_id_32c4d441_fk_apis_subject_id", deferrable: :deferred
  add_foreign_key "apis_subject_students", "core_customuser", column: "customuser_id", name: "apis_subject_student_customuser_id_8bf823d1_fk_core_cust", deferrable: :deferred
  add_foreign_key "apis_subject_teachers", "apis_subject", column: "subject_id", name: "apis_subject_teachers_subject_id_1d0c947c_fk_apis_subject_id", deferrable: :deferred
  add_foreign_key "apis_subject_teachers", "core_customuser", column: "customuser_id", name: "apis_subject_teacher_customuser_id_c2e85181_fk_core_cust", deferrable: :deferred
  add_foreign_key "apis_timetable", "core_customuser", column: "teacher_id", name: "apis_timetable_teacher_id_6aa77691_fk_core_customuser_id", deferrable: :deferred
  add_foreign_key "auth_group_permissions", "auth_group", column: "group_id", name: "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id", deferrable: :deferred
  add_foreign_key "auth_group_permissions", "auth_permission", column: "permission_id", name: "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm", deferrable: :deferred
  add_foreign_key "auth_permission", "django_content_type", column: "content_type_id", name: "auth_permission_content_type_id_2f476e4b_fk_django_co", deferrable: :deferred
  add_foreign_key "core_customuser_groups", "auth_group", column: "group_id", name: "core_customuser_groups_group_id_301aeff4_fk_auth_group_id", deferrable: :deferred
  add_foreign_key "core_customuser_groups", "core_customuser", column: "customuser_id", name: "core_customuser_grou_customuser_id_976bc4d7_fk_core_cust", deferrable: :deferred
  add_foreign_key "core_customuser_user_permissions", "auth_permission", column: "permission_id", name: "core_customuser_user_permission_id_80ceaab9_fk_auth_perm", deferrable: :deferred
  add_foreign_key "core_customuser_user_permissions", "core_customuser", column: "customuser_id", name: "core_customuser_user_customuser_id_ebd2ce6c_fk_core_cust", deferrable: :deferred
  add_foreign_key "django_admin_log", "core_customuser", column: "user_id", name: "django_admin_log_user_id_c564eba6_fk_core_customuser_id", deferrable: :deferred
  add_foreign_key "django_admin_log", "django_content_type", column: "content_type_id", name: "django_admin_log_content_type_id_c4bce8eb_fk_django_co", deferrable: :deferred
end
