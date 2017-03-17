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

ActiveRecord::Schema.define(version: 20161215202255) do

  create_table "cama_comments", force: true do |t|
    t.string   "author"
    t.string   "author_email"
    t.string   "author_url"
    t.string   "author_IP"
    t.text     "content"
    t.string   "approved",       default: "pending"
    t.string   "agent"
    t.string   "typee"
    t.integer  "comment_parent"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "cama_comments", ["post_id"], name: "index_cama_comments_on_post_id", using: :btree
  add_index "cama_comments", ["user_id"], name: "index_cama_comments_on_user_id", using: :btree

  create_table "cama_custom_fields", force: true do |t|
    t.string  "object_class"
    t.string  "name"
    t.string  "slug"
    t.integer "objectid"
    t.integer "parent_id"
    t.integer "field_order"
    t.integer "count",        default: 0
    t.boolean "is_repeat",    default: false
    t.text    "description"
    t.string  "status"
  end

  create_table "cama_custom_fields_relationships", force: true do |t|
    t.integer "objectid"
    t.integer "custom_field_id"
    t.integer "term_order"
    t.string  "object_class"
    t.text    "value",             limit: 2147483647
    t.string  "custom_field_slug"
    t.integer "group_number",                         default: 0
  end

  create_table "cama_metas", force: true do |t|
    t.string  "key"
    t.text    "value",        limit: 2147483647
    t.integer "objectid"
    t.string  "object_class"
  end

  create_table "cama_posts", force: true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "content",          limit: 2147483647
    t.text     "content_filtered", limit: 2147483647
    t.string   "status",                              default: "published"
    t.datetime "published_at"
    t.integer  "post_parent"
    t.string   "visibility",                          default: "public"
    t.text     "visibility_value"
    t.string   "post_class",                          default: "Post"
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.integer  "user_id"
    t.integer  "post_order",                          default: 0
    t.integer  "taxonomy_id"
    t.boolean  "is_feature",                          default: false
  end

  add_index "cama_posts", ["user_id"], name: "index_cama_posts_on_user_id", using: :btree

  create_table "cama_term_relationships", force: true do |t|
    t.integer "objectid"
    t.integer "term_order"
    t.integer "term_taxonomy_id"
  end

  add_index "cama_term_relationships", ["term_taxonomy_id"], name: "index_cama_term_relationships_on_term_taxonomy_id", using: :btree

  create_table "cama_term_taxonomy", force: true do |t|
    t.string   "taxonomy"
    t.text     "description", limit: 2147483647
    t.integer  "parent_id"
    t.integer  "count"
    t.string   "name"
    t.string   "slug"
    t.integer  "term_group"
    t.integer  "term_order"
    t.string   "status"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "user_id"
  end

  add_index "cama_term_taxonomy", ["user_id"], name: "index_cama_term_taxonomy_on_user_id", using: :btree

  create_table "cama_users", force: true do |t|
    t.string   "username"
    t.string   "role",                   default: "client"
    t.string   "email"
    t.string   "slug"
    t.string   "password_digest"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.integer  "parent_id"
    t.datetime "password_reset_sent_at"
    t.datetime "last_login_at"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "site_id",                default: -1
    t.string   "confirm_email_token"
    t.datetime "confirm_email_sent_at"
    t.boolean  "is_valid_email",         default: true
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "cama_users", ["site_id"], name: "index_cama_users_on_site_id", using: :btree

  create_table "plugins_attacks", force: true do |t|
    t.string   "path"
    t.string   "browser_key"
    t.integer  "site_id"
    t.datetime "created_at"
  end

  add_index "plugins_attacks", ["site_id"], name: "index_plugins_attacks_on_site_id", using: :btree

  create_table "plugins_contact_forms", force: true do |t|
    t.integer  "site_id"
    t.integer  "count"
    t.integer  "parent_id"
    t.string   "name"
    t.string   "slug"
    t.text     "description"
    t.text     "value"
    t.text     "settings"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plugins_ecommerce_attributes", force: true do |t|
    t.string  "key"
    t.string  "label"
    t.integer "parent_id"
    t.integer "site_id"
    t.integer "position",  default: 0
  end

  create_table "plugins_ecommerce_orders", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "kind"
    t.string   "coupon"
    t.string   "the_coupon_amount"
    t.string   "currency_code"
    t.string   "payment_data"
    t.string   "status",                                      default: "unpaid"
    t.integer  "shipping_method_id"
    t.integer  "user_id"
    t.integer  "site_id"
    t.integer  "payment_method_id"
    t.datetime "paid_at"
    t.datetime "received_at"
    t.datetime "accepted_at"
    t.datetime "shipped_at"
    t.datetime "closed_at"
    t.string   "cache_the_total"
    t.string   "cache_the_sub_total"
    t.string   "cache_the_tax"
    t.string   "cache_the_weight"
    t.string   "cache_the_discounts"
    t.string   "cache_the_shipping"
    t.decimal  "amount",              precision: 8, scale: 2
    t.text     "description"
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.string   "visitor_key"
    t.string   "invoice_number",                              default: ""
    t.string   "invoice_path",                                default: ""
  end

  create_table "plugins_ecommerce_product_variations", force: true do |t|
    t.decimal "amount",        precision: 8, scale: 2
    t.integer "product_id"
    t.string  "photo"
    t.string  "sku"
    t.integer "weight"
    t.integer "position",                              default: 0
    t.integer "qty",                                   default: 0
    t.string  "attribute_ids"
  end

  add_index "plugins_ecommerce_product_variations", ["product_id"], name: "index_plugins_ecommerce_product_variations_on_product_id", using: :btree

  create_table "plugins_ecommerce_products", force: true do |t|
    t.integer "qty"
    t.integer "product_id"
    t.integer "order_id"
    t.string  "cache_the_price"
    t.string  "cache_the_title"
    t.string  "cache_the_tax"
    t.string  "cache_the_sub_total"
    t.integer "variation_id"
  end

  create_table "plugins_order_details", force: true do |t|
    t.integer  "order_id"
    t.string   "customer"
    t.string   "email"
    t.string   "phone"
    t.datetime "received_at"
    t.datetime "accepted_at"
    t.datetime "shipped_at"
    t.datetime "closed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
