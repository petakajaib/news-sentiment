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

ActiveRecord::Schema.define(version: 2019_02_07_082957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entities", force: :cascade do |t|
    t.string "name"
    t.string "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entity_sentences", force: :cascade do |t|
    t.integer "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sentence_id"
  end

  create_table "entity_sources", force: :cascade do |t|
    t.integer "entity_id"
    t.integer "source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sentences", force: :cascade do |t|
    t.string "language_code"
    t.integer "source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sentence"
    t.integer "tokens_count"
  end

  create_table "sentiments", force: :cascade do |t|
    t.float "positive"
    t.float "negative"
    t.integer "sentence_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "source_id"
    t.integer "entity_id"
    t.integer "sentiment"
  end

  create_table "sources", force: :cascade do |t|
    t.string "url"
    t.datetime "published_date"
    t.integer "day"
    t.integer "month"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
