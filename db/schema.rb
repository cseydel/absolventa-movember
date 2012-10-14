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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121014111607) do

  create_table "access_rights", :force => true do |t|
    t.integer  "grantable_id"
    t.integer  "supervisor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "grantable_type"
    t.datetime "expired_at"
  end

  add_index "access_rights", ["grantable_id", "grantable_type"], :name => "index_access_rights_on_grantable_id_and_grantable_type"
  add_index "access_rights", ["grantable_type"], :name => "index_access_rights_on_grantable_type"
  add_index "access_rights", ["supervisor_id"], :name => "index_access_rights_on_supervisor_id"

  create_table "activities", :force => true do |t|
    t.date     "started_on"
    t.date     "finished_on"
    t.string   "title"
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "completion_value", :default => 0
    t.integer  "user_id"
  end

  add_index "activities", ["user_id", "position"], :name => "index_activities_on_user_id_and_position"

  create_table "additional_rights", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "additional_rights", ["name"], :name => "index_additional_rights_on_name"

  create_table "affiliate_keys", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "key"
    t.string   "description",       :limit => 50, :null => false
    t.integer  "affiliate_user_id"
  end

  add_index "affiliate_keys", ["affiliate_user_id"], :name => "index_affiliate_keys_on_affiliate_user_id"
  add_index "affiliate_keys", ["key"], :name => "index_affiliate_keys_on_affiliate_key"

  create_table "affiliate_users", :force => true do |t|
    t.string   "username",   :limit => 50
    t.string   "firstname",  :limit => 50
    t.string   "surname",    :limit => 50
    t.string   "email",      :limit => 50
    t.string   "password",   :limit => 50
    t.integer  "logincount", :limit => 8,  :default => 0
    t.datetime "lastlogin",                :default => '1970-01-01 00:00:00', :null => false
    t.string   "phone"
    t.string   "mobile"
    t.string   "fax"
    t.string   "street"
    t.string   "zipcode"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "affiliate_users", ["username"], :name => "index_affiliate_users_on_username", :unique => true

  create_table "annotations", :force => true do |t|
    t.text     "content"
    t.boolean  "private"
    t.integer  "recruiter_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "annotations", ["recruiter_id", "user_id"], :name => "index_annotations_on_recruiter_id_and_graduate_id"
  add_index "annotations", ["user_id"], :name => "index_annotations_on_graduate_id"

  create_table "apprenticeships", :force => true do |t|
    t.date     "started_on"
    t.date     "finished_on"
    t.string   "title"
    t.string   "organization"
    t.string   "location"
    t.string   "focus"
    t.string   "grade"
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "completion_value", :default => 0
    t.integer  "user_id"
  end

  add_index "apprenticeships", ["user_id", "position"], :name => "index_apprenticeships_on_user_id_and_position"

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "authentications", ["provider", "uid"], :name => "index_authentications_on_provider_and_uid"
  add_index "authentications", ["user_id"], :name => "index_authentications_on_user_id"

  create_table "awards", :force => true do |t|
    t.string   "title"
    t.date     "award_date"
    t.string   "url"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "awards", ["company_id"], :name => "index_awards_on_company_id"
  add_index "awards", ["position"], :name => "index_awards_on_position"

  create_table "blacklist_items", :force => true do |t|
    t.string   "url"
    t.string   "content_type", :limit => 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blacklist_items", ["url", "content_type"], :name => "index_blacklist_items_on_url_and_content_type"

  create_table "bros", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "buckets", :force => true do |t|
    t.string   "name"
    t.integer  "recruiter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "built_in"
  end

  add_index "buckets", ["recruiter_id"], :name => "index_buckets_on_recruiter_id"

  create_table "business_partners", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.text     "teaser"
    t.string   "category"
    t.boolean  "detail_page"
    t.boolean  "visible_absolventa"
    t.boolean  "visible_jobnet"
    t.text     "description_title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "screenshot_file_name"
    t.string   "screenshot_content_type"
    t.integer  "screenshot_file_size"
    t.datetime "screenshot_updated_at"
    t.string   "alt_text"
  end

  create_table "career_guides", :force => true do |t|
    t.string   "permalink"
    t.string   "title"
    t.string   "meta_keywords"
    t.string   "meta_description"
    t.string   "headline"
    t.text     "teaser"
    t.text     "content"
    t.string   "hyperlink_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
    t.string   "h1"
    t.string   "h3_1"
    t.string   "h3_2"
    t.string   "h3_3"
  end

  add_index "career_guides", ["ancestry"], :name => "index_career_guides_on_ancestry"
  add_index "career_guides", ["permalink"], :name => "index_career_guides_on_permalink"

  create_table "channel_mappings", :force => true do |t|
    t.integer  "channel_id"
    t.integer  "mappable_id"
    t.string   "mappable_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "channel_mappings", ["channel_id"], :name => "index_channel_mappings_on_channel_id"
  add_index "channel_mappings", ["mappable_id", "mappable_type"], :name => "index_channel_mappings_on_mappable_id_and_mappable_type"
  add_index "channel_mappings", ["mappable_type"], :name => "index_channel_mappings_on_mappable_type"

  create_table "channels", :force => true do |t|
    t.string   "title"
    t.string   "ancestry"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "channels", ["ancestry"], :name => "index_channels_on_ancestry"

  create_table "cities", :force => true do |t|
    t.string   "title"
    t.string   "internal_title"
    t.integer  "position"
    t.integer  "population"
    t.integer  "in_degree",      :default => 0
    t.integer  "out_degree",     :default => 0
    t.float    "lng"
    t.float    "lat"
    t.date     "visible_since"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["internal_title"], :name => "index_cities_on_internal_title", :unique => true

  create_table "city_links", :force => true do |t|
    t.integer  "source_id"
    t.integer  "destination_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "city_links", ["destination_id"], :name => "index_city_links_on_destination_id"
  add_index "city_links", ["source_id"], :name => "index_city_links_on_source_id"

  create_table "civil_services", :force => true do |t|
    t.date     "started_on"
    t.date     "finished_on"
    t.string   "organization"
    t.string   "location"
    t.string   "category"
    t.string   "job_title"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "completion_value", :default => 0
    t.integer  "user_id"
  end

  add_index "civil_services", ["user_id", "position"], :name => "index_civil_services_on_user_id_and_position"

  create_table "companies", :force => true do |t|
    t.text     "description"
    t.string   "title",                                         :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "visible",                     :default => true
    t.string   "street"
    t.string   "zip"
    t.string   "city"
    t.string   "country"
    t.boolean  "is_absolventa"
    t.text     "specifics"
    t.string   "homepage"
    t.boolean  "speculative_job_application"
    t.string   "billing_contact_person"
    t.string   "billing_street"
    t.string   "billing_zip"
    t.string   "billing_city"
    t.string   "billing_country"
    t.integer  "supervisor_id"
    t.integer  "current_contract_id"
    t.datetime "tos_confirmed_at"
    t.string   "billing_company"
    t.integer  "current_company_profile_id"
    t.string   "employees"
    t.string   "revenue"
    t.string   "permalink"
    t.boolean  "external"
    t.boolean  "trainee_seal"
    t.date     "trainee_seal_started_at"
    t.string   "trainee_gefluester_url"
    t.text     "description_long"
    t.text     "philosophy"
    t.text     "employer"
    t.string   "company_size"
  end

  add_index "companies", ["current_company_profile_id"], :name => "index_companies_on_current_company_profile_id"
  add_index "companies", ["current_contract_id"], :name => "index_companies_on_current_contract_id"
  add_index "companies", ["is_absolventa"], :name => "index_companies_on_is_absolventa"
  add_index "companies", ["permalink"], :name => "index_companies_on_permalink", :unique => true
  add_index "companies", ["supervisor_id"], :name => "index_companies_on_supervisor_id"
  add_index "companies", ["title"], :name => "index_companies_on_title"
  add_index "companies", ["visible", "title"], :name => "index_companies_on_visible_and_title"

  create_table "company_locations", :force => true do |t|
    t.string   "title"
    t.string   "street"
    t.string   "zip"
    t.string   "city"
    t.integer  "company_id"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "company_locations", ["company_id"], :name => "index_company_locations_on_company_id"
  add_index "company_locations", ["country_id"], :name => "index_company_locations_on_country_id"
  add_index "company_locations", ["position"], :name => "index_company_locations_on_position"

  create_table "company_profiles", :force => true do |t|
    t.string   "profile_type"
    t.integer  "company_id"
    t.integer  "recruiter_id"
    t.integer  "discount"
    t.integer  "monthly_fee"
    t.integer  "duration"
    t.datetime "started_at"
    t.datetime "expires_at"
    t.datetime "verified_at"
    t.string   "state"
    t.boolean  "special_conditions"
    t.boolean  "prolongate"
    t.boolean  "prolongation_warning"
    t.datetime "prolongation_notified_at"
    t.integer  "predecessor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "employee_count"
    t.integer  "yearly_fee"
  end

  add_index "company_profiles", ["company_id"], :name => "index_company_profiles_on_company_id"
  add_index "company_profiles", ["predecessor_id"], :name => "index_company_profiles_on_predecessor_id"
  add_index "company_profiles", ["profile_type"], :name => "index_company_profiles_on_profile_type"
  add_index "company_profiles", ["recruiter_id"], :name => "index_company_profiles_on_recruiter_id"
  add_index "company_profiles", ["state"], :name => "index_company_profiles_on_state"

  create_table "contacts", :force => true do |t|
    t.integer  "order_id"
    t.datetime "responded_at"
    t.string   "status"
    t.text     "feedback"
    t.date     "available_on"
    t.datetime "archived_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "snapshot_id"
    t.text     "contact_data"
    t.string   "s3_filename"
    t.string   "pdf_filename"
    t.datetime "pdf_generated_at"
    t.text     "conversion_error"
    t.datetime "queued_at"
    t.datetime "pdf_last_accessed_at"
    t.datetime "reminded_at"
    t.datetime "first_accessed_at"
    t.text     "negative_feedback"
    t.string   "user_response"
    t.datetime "recruiter_last_notified_at"
    t.integer  "recruiter_notified_count",   :default => 0
    t.datetime "response_sent_at"
    t.datetime "request_sent_at"
    t.integer  "user_id"
    t.integer  "promotion_id"
    t.datetime "user_last_notified_at"
    t.integer  "user_notified_count",        :default => 0
    t.integer  "sex"
    t.string   "title"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "phone"
    t.string   "cellphone"
    t.string   "address"
    t.string   "zip"
    t.string   "city"
    t.string   "country"
    t.integer  "recruiter_id"
  end

  add_index "contacts", ["created_at"], :name => "index_contacts_on_created_at"
  add_index "contacts", ["order_id", "status"], :name => "index_contacts_on_order_id_and_status_and_graduate_id"
  add_index "contacts", ["promotion_id"], :name => "index_contacts_on_promotion_id"
  add_index "contacts", ["queued_at", "s3_filename"], :name => "index_contacts_on_queued_at_and_s3_filename"
  add_index "contacts", ["recruiter_id"], :name => "index_contacts_on_recruiter_id"
  add_index "contacts", ["snapshot_id"], :name => "index_contacts_on_snapshot_id"
  add_index "contacts", ["user_id"], :name => "index_contacts_on_user_id"

  create_table "contracts", :force => true do |t|
    t.integer  "company_id"
    t.integer  "recruiter_id"
    t.integer  "price_model_id"
    t.datetime "started_at"
    t.datetime "expires_at"
    t.integer  "duration"
    t.boolean  "prolongate"
    t.integer  "discount"
    t.string   "state"
    t.datetime "verified_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "predecessor_id"
    t.boolean  "cyquest"
    t.integer  "monthly_fee",              :default => 0
    t.integer  "employee_count"
    t.boolean  "special_conditions"
    t.boolean  "prolongation_warning"
    t.datetime "prolongation_notified_at"
  end

  add_index "contracts", ["company_id"], :name => "index_contracts_on_company_id"
  add_index "contracts", ["predecessor_id"], :name => "index_contracts_on_predecessor_id"
  add_index "contracts", ["price_model_id"], :name => "index_contracts_on_price_model_id"
  add_index "contracts", ["recruiter_id"], :name => "index_contracts_on_recruiter_id"
  add_index "contracts", ["state"], :name => "index_contracts_on_state"

  create_table "convertibles", :force => true do |t|
    t.integer  "owner_id"
    t.string   "owner_type"
    t.text     "source_data"
    t.string   "destination_url"
    t.datetime "conversion_started_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "secure_token"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
  end

  add_index "convertibles", ["owner_id", "owner_type"], :name => "index_convertibles_on_owner_id_and_owner_type"

  create_table "countries", :force => true do |t|
    t.string   "country_code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_registrations", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address"
    t.string   "city"
    t.string   "zip"
    t.string   "phone"
    t.string   "email"
    t.integer  "people",              :default => 1
    t.text     "message"
    t.string   "college_city"
    t.string   "college"
    t.string   "study_subject"
    t.string   "mlp_office_name"
    t.string   "mlp_office_number"
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "birthdate"
    t.string   "desired_course_city"
    t.integer  "semesters"
    t.date     "studies_finished_on"
    t.boolean  "external"
    t.string   "phone_availability"
    t.string   "occupation_group"
    t.string   "highest_degree"
    t.string   "company_employees"
    t.string   "college_degree"
    t.string   "lead_category"
    t.integer  "mlp_office_id"
    t.string   "state"
    t.string   "rejection_reason"
    t.integer  "sex"
    t.string   "title"
    t.datetime "billed_at"
    t.datetime "paid_at"
    t.string   "source"
  end

  add_index "course_registrations", ["course_id"], :name => "index_course_registrations_on_course_id"
  add_index "course_registrations", ["email", "course_id"], :name => "index_course_registrations_on_email_and_course_id", :unique => true
  add_index "course_registrations", ["mlp_office_id"], :name => "index_course_registrations_on_mlp_office_id"
  add_index "course_registrations", ["source"], :name => "index_course_registrations_on_source"
  add_index "course_registrations", ["state"], :name => "index_course_registrations_on_state"
  add_index "course_registrations", ["user_id"], :name => "index_course_registrations_on_user_id"

  create_table "courses", :force => true do |t|
    t.string   "title"
    t.text     "teaser"
    t.text     "description"
    t.boolean  "published",                                                 :default => true
    t.decimal  "fee",                         :precision => 8, :scale => 2, :default => 0.0
    t.integer  "course_registrations_count",                                :default => 0
    t.integer  "course_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "course_picture_file_name"
    t.string   "course_picture_content_type"
    t.integer  "course_picture_file_size"
    t.datetime "course_picture_updated_at"
    t.string   "identifier"
    t.string   "footer"
    t.string   "html_page_title"
    t.text     "meta_description"
    t.text     "keywords"
    t.string   "permalink"
    t.string   "category"
  end

  add_index "courses", ["course_type_id"], :name => "index_courses_on_course_type_id"
  add_index "courses", ["permalink"], :name => "index_courses_on_permalink"
  add_index "courses", ["title"], :name => "index_courses_on_title"

  create_table "cv_list_items", :force => true do |t|
    t.string   "column1"
    t.integer  "position"
    t.integer  "completion_value"
    t.integer  "cv_list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cv_list_items", ["cv_list_id", "position"], :name => "index_cv_list_items_on_cv_list_id_and_position"

  create_table "cv_lists", :force => true do |t|
    t.string   "title"
    t.integer  "position"
    t.integer  "completion_value"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cv_lists", ["user_id", "position"], :name => "index_cv_lists_on_user_id_and_position"

  create_table "cv_table_items", :force => true do |t|
    t.string   "column1"
    t.string   "column2"
    t.integer  "position"
    t.integer  "completion_value"
    t.integer  "cv_table_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cv_table_items", ["cv_table_id", "position"], :name => "index_cv_table_items_on_cv_table_id_and_position"

  create_table "cv_tables", :force => true do |t|
    t.string   "title"
    t.integer  "position"
    t.integer  "completion_value"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cv_tables", ["user_id", "position"], :name => "index_cv_tables_on_user_id_and_position"

  create_table "data_aggregations", :force => true do |t|
    t.integer  "graduate_id"
    t.string   "graduate_link"
    t.string   "email"
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "dateofbirth"
    t.datetime "email_verified_at"
    t.boolean  "active"
    t.integer  "active_days_remaining"
    t.datetime "last_activated_at"
    t.boolean  "deactivated"
    t.integer  "completion_score"
    t.string   "application"
    t.datetime "premium_started_at"
    t.datetime "premium_ended_at"
    t.string   "course_of_study"
    t.string   "categorized_course_of_study"
    t.string   "categorized_type"
    t.string   "categorized_university"
    t.string   "categorized_degree"
    t.boolean  "newsletter_opt_in"
    t.boolean  "jobletter_opt_in"
    t.boolean  "events_opt_in"
    t.boolean  "blog_opt_in"
    t.boolean  "salary_analysis_opt_in"
    t.datetime "salary_analysis_application"
    t.datetime "salary_analysis_done"
    t.datetime "mlp_seminar_application"
    t.datetime "company_special_application"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "zip"
    t.integer  "sex"
    t.integer  "total_experience"
    t.string   "categorized_university_type"
    t.integer  "categorized_grade"
    t.string   "personal_code"
    t.datetime "study_finished_on"
    t.string   "categorized_major"
    t.integer  "total_international_experience"
    t.integer  "total_internship"
    t.integer  "contacts_count"
    t.string   "email_verification_code"
    t.string   "current_user_type"
    t.string   "degree_taxonomy"
    t.string   "favorite_departments"
    t.string   "favorite_jobplacements"
  end

  add_index "data_aggregations", ["email"], :name => "index_data_aggregations_on_email"
  add_index "data_aggregations", ["graduate_id"], :name => "index_data_aggregations_on_graduate_id"

  create_table "degree_taxonomies", :force => true do |t|
    t.string   "key"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "degree_taxonomies", ["title"], :name => "index_degree_taxonomies_on_title"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "queue"
  end

  add_index "delayed_jobs", ["locked_by"], :name => "delayed_jobs_locked_by"
  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "department_mappings", :force => true do |t|
    t.integer  "department_id"
    t.integer  "mappable_id"
    t.string   "mappable_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "department_mappings", ["department_id"], :name => "index_department_mappings_on_department_id"
  add_index "department_mappings", ["mappable_id", "mappable_type"], :name => "index_department_mappings_on_mappable_id_and_mappable_type"
  add_index "department_mappings", ["mappable_type"], :name => "index_department_mappings_on_mappable_type"

  create_table "departments", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
  end

  add_index "departments", ["permalink"], :name => "index_departments_on_permalink"
  add_index "departments", ["title"], :name => "index_departments_on_title"

  create_table "document_mappings", :force => true do |t|
    t.string   "title"
    t.integer  "document_id"
    t.integer  "documentable_id"
    t.string   "documentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "document_mappings", ["document_id"], :name => "index_document_mappings_on_document_id"
  add_index "document_mappings", ["documentable_id"], :name => "index_document_mappings_on_documentable_id"
  add_index "document_mappings", ["documentable_type", "documentable_id"], :name => "index_document_mappings_on_doc_type_and_doc_id"

  create_table "documents", :force => true do |t|
    t.string   "title"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_type"
  end

  add_index "documents", ["owner_id", "owner_type"], :name => "index_documents_on_owner_id_and_owner_type"
  add_index "documents", ["owner_type"], :name => "index_documents_on_owner_type"

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "location"
    t.datetime "event_at"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.string   "url"
  end

  add_index "events", ["owner_id", "owner_type"], :name => "index_events_on_owner_id_and_owner_type"
  add_index "events", ["owner_type"], :name => "index_events_on_owner_type"
  add_index "events", ["position"], :name => "index_events_on_position"

  create_table "experiences", :force => true do |t|
    t.string   "organization"
    t.string   "location"
    t.string   "job_title"
    t.date     "started_on"
    t.date     "finished_on"
    t.string   "focus"
    t.text     "description"
    t.integer  "hours_per_week"
    t.boolean  "fulltime"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "completion_value", :default => 0
    t.integer  "user_id"
  end

  add_index "experiences", ["user_id", "position"], :name => "index_experiences_on_user_id_and_position"

  create_table "expert_interviews", :force => true do |t|
    t.string   "title"
    t.datetime "occurred_at"
    t.string   "url"
    t.text     "content"
    t.string   "source"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "expert_interviews", ["owner_id", "owner_type"], :name => "index_expert_interviews_on_owner_id_and_owner_type"
  add_index "expert_interviews", ["owner_type"], :name => "index_expert_interviews_on_owner_type"
  add_index "expert_interviews", ["position"], :name => "index_expert_interviews_on_position"

  create_table "fair_events", :force => true do |t|
    t.datetime "started_at"
    t.datetime "ended_at"
    t.text     "target_group"
    t.string   "street"
    t.string   "zip"
    t.string   "city"
    t.string   "location"
    t.string   "opening_hours"
    t.integer  "fair_id"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.decimal  "latitude",            :precision => 10, :scale => 0
    t.decimal  "longtitude",          :precision => 10, :scale => 0
    t.string   "fair_title"
    t.string   "fair_permalink"
    t.boolean  "fair_premium"
    t.string   "fair_logo_thumb"
    t.integer  "fair_host_id"
    t.string   "fair_host_title"
    t.string   "fair_host_permalink"
    t.boolean  "fair_host_premium"
    t.string   "fee"
    t.decimal  "limitation",          :precision => 10, :scale => 0
    t.integer  "jobmesse_radar_id"
  end

  add_index "fair_events", ["country_id"], :name => "index_fair_events_on_country_id"
  add_index "fair_events", ["fair_id"], :name => "index_fair_events_on_fair_id"
  add_index "fair_events", ["jobmesse_radar_id"], :name => "index_fair_events_on_jobmesse_radar_id"

  create_table "favorite_locations", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "favorite_locations", ["position", "title", "user_id"], :name => "index_favorite_locations_on_position_and_title_and_graduate_id"
  add_index "favorite_locations", ["title"], :name => "index_favorite_locations_on_title"
  add_index "favorite_locations", ["user_id"], :name => "index_favorite_locations_on_graduate_id"

  create_table "featured_companies", :force => true do |t|
    t.integer "company_id"
    t.integer "rank"
    t.integer "category",   :default => 0
  end

  add_index "featured_companies", ["company_id"], :name => "index_featured_companies_on_company_id"
  add_index "featured_companies", ["rank", "category"], :name => "index_featured_companies_on_rank_and_category"

  create_table "featured_logo_areas", :force => true do |t|
    t.integer  "company_id"
    t.string   "area"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "featured_logo_areas", ["area"], :name => "index_featured_logo_areas_on_area"
  add_index "featured_logo_areas", ["company_id"], :name => "index_featured_logo_areas_on_company_id"

  create_table "feed_item_logs", :force => true do |t|
    t.integer  "owner_id"
    t.integer  "feed_item_id"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "owner_type"
  end

  add_index "feed_item_logs", ["action"], :name => "index_feed_item_logs_on_action"
  add_index "feed_item_logs", ["feed_item_id"], :name => "index_feed_item_logs_on_feed_item_id"
  add_index "feed_item_logs", ["owner_id", "owner_type"], :name => "index_feed_item_logs_on_owner_id_and_owner_type"
  add_index "feed_item_logs", ["owner_type"], :name => "index_feed_item_logs_on_owner_type"

  create_table "feed_items", :force => true do |t|
    t.boolean  "broadcast"
    t.text     "content"
    t.integer  "owner_id"
    t.integer  "originator_id"
    t.string   "originator_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "owner_type"
  end

  add_index "feed_items", ["broadcast"], :name => "index_feed_items_on_broadcast"
  add_index "feed_items", ["originator_id", "originator_type"], :name => "index_feed_items_on_originator_id_and_originator_type"
  add_index "feed_items", ["originator_type"], :name => "index_feed_items_on_originator_type"
  add_index "feed_items", ["owner_id", "owner_type"], :name => "index_feed_items_on_owner_id_and_owner_type"
  add_index "feed_items", ["owner_type"], :name => "index_feed_items_on_owner_type"

  create_table "field_reports", :force => true do |t|
    t.string   "expert_name"
    t.string   "expert_position"
    t.text     "content"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "field_reports", ["owner_id", "owner_type"], :name => "index_field_reports_on_owner_id_and_owner_type"
  add_index "field_reports", ["owner_type"], :name => "index_field_reports_on_owner_type"
  add_index "field_reports", ["position"], :name => "index_field_reports_on_position"

  create_table "google_metrics", :force => true do |t|
    t.date     "measured_at"
    t.integer  "measurable_id"
    t.string   "measurable_type"
    t.integer  "pageviews"
    t.integer  "unique_pageviews"
    t.integer  "visitors"
    t.integer  "entrances"
    t.integer  "exits"
    t.float    "avg_time_on_page"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "google_metrics", ["measurable_id", "measurable_type"], :name => "index_google_metrics_on_measurable_id_and_measurable_type"
  add_index "google_metrics", ["measured_at"], :name => "index_google_metrics_on_measured_at"

  create_table "hr_contacts", :force => true do |t|
    t.integer  "recruiter_id"
    t.integer  "company_id"
    t.boolean  "responsible"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "hr_contacts", ["company_id"], :name => "index_hr_contacts_on_company_id"
  add_index "hr_contacts", ["position"], :name => "index_hr_contacts_on_position"
  add_index "hr_contacts", ["recruiter_id"], :name => "index_hr_contacts_on_recruiter_id"

  create_table "ignore_items", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.integer  "ignorable_id"
    t.string   "ignorable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ignore_items", ["ignorable_id", "ignorable_type"], :name => "index_ignore_items_on_ignorable_id_and_ignorable_type"
  add_index "ignore_items", ["ignorable_type"], :name => "index_ignore_items_on_ignorable_type"
  add_index "ignore_items", ["user_id"], :name => "index_ignore_items_on_user_id"

  create_table "international_experiences", :force => true do |t|
    t.string   "country"
    t.date     "started_on"
    t.date     "finished_on"
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "completion_value", :default => 0
    t.integer  "user_id"
  end

  add_index "international_experiences", ["user_id", "position"], :name => "index_international_experiences_on_user_id_and_position"

  create_table "internships", :force => true do |t|
    t.string   "organization"
    t.string   "location"
    t.date     "started_on"
    t.date     "finished_on"
    t.string   "focus"
    t.text     "description"
    t.integer  "hours_per_week"
    t.boolean  "fulltime"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "completion_value", :default => 0
    t.integer  "user_id"
  end

  add_index "internships", ["user_id", "position"], :name => "index_internships_on_user_id_and_position"

  create_table "interview_events", :force => true do |t|
    t.integer  "event_id"
    t.string   "event_type"
    t.integer  "phone_interview_id"
    t.string   "reason"
    t.integer  "status_code"
    t.integer  "phone_call_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "event_action"
  end

  add_index "interview_events", ["event_action"], :name => "index_interview_events_on_event_action"
  add_index "interview_events", ["event_id", "event_type"], :name => "index_interview_events_on_event_id_and_event_type"
  add_index "interview_events", ["phone_call_id"], :name => "index_interview_events_on_phone_call_id"
  add_index "interview_events", ["phone_interview_id", "event_id"], :name => "index_interview_events_on_phone_interview_id_and_event_id"

  create_table "intros", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "completion_value", :default => 0
    t.integer  "user_id"
  end

  add_index "intros", ["user_id", "position"], :name => "index_intros_on_user_id_and_position"

  create_table "job_alert_mappings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "job_offer_id"
    t.datetime "sent_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "job_alert_mappings", ["job_offer_id"], :name => "index_job_alert_mappings_on_job_offer_id"
  add_index "job_alert_mappings", ["user_id", "job_offer_id"], :name => "index_job_alert_mappings_on_user_id_and_job_offer_id"

  create_table "job_applications", :force => true do |t|
    t.integer  "job_offer_id"
    t.integer  "user_id"
    t.text     "user_statement"
    t.string   "user_headline"
    t.string   "state"
    t.datetime "rejected_at"
    t.datetime "rejection_time"
    t.string   "pdf_filename"
    t.datetime "pdf_generated_at"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address"
    t.string   "zip"
    t.string   "city"
    t.string   "country"
    t.string   "email"
    t.string   "phone"
    t.string   "cellphone"
    t.date     "birthdate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.integer  "sex"
    t.datetime "recruiter_last_notified_at"
    t.integer  "recruiter_notified_count",   :default => 0
    t.integer  "profile_number"
    t.integer  "version",                    :default => 0
    t.boolean  "external"
    t.date     "available_from"
    t.text     "rejection_text"
    t.integer  "rejection_template_id"
    t.boolean  "absolventa_cv"
  end

  add_index "job_applications", ["firstname"], :name => "index_job_applications_on_firstname"
  add_index "job_applications", ["job_offer_id"], :name => "index_job_applications_on_job_offer_id"
  add_index "job_applications", ["lastname"], :name => "index_job_applications_on_lastname"
  add_index "job_applications", ["profile_number"], :name => "index_job_applications_on_profile_number"
  add_index "job_applications", ["rejection_template_id"], :name => "index_job_applications_on_rejection_template_id"
  add_index "job_applications", ["state"], :name => "index_job_applications_on_state"
  add_index "job_applications", ["user_id"], :name => "index_job_applications_on_user_id"

  create_table "job_favorites", :force => true do |t|
    t.integer  "job_offer_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_favorites", ["job_offer_id"], :name => "index_job_favorites_on_job_offer_id"
  add_index "job_favorites", ["user_id"], :name => "index_job_favorites_on_user_id"

  create_table "job_offer_queries", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "text"
    t.string   "city"
    t.string   "radius_max"
    t.string   "scat"
    t.string   "dep"
    t.string   "pos"
    t.string   "interval"
    t.datetime "sent_at"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.boolean  "job_alert",  :default => true
  end

  add_index "job_offer_queries", ["user_id"], :name => "index_job_alerts_on_user_id"

  create_table "job_offer_recommendations", :force => true do |t|
    t.string   "sender_email"
    t.string   "receiver_email"
    t.string   "name"
    t.text     "content"
    t.integer  "job_offer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_offer_recommendations", ["job_offer_id"], :name => "index_job_offer_recommendations_on_job_offer_id"
  add_index "job_offer_recommendations", ["receiver_email"], :name => "index_job_offer_recommendations_on_receiver_email"
  add_index "job_offer_recommendations", ["sender_email"], :name => "index_job_offer_recommendations_on_sender_email"

  create_table "job_offers", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.integer  "company_id"
    t.integer  "recruiter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reference_number"
    t.text     "company_description"
    t.integer  "job_applications_count",             :default => 0
    t.boolean  "instant_notification"
    t.datetime "archived_at"
    t.string   "state"
    t.string   "street"
    t.string   "zip"
    t.string   "city"
    t.boolean  "many_locations"
    t.string   "external_url"
    t.boolean  "promoted_on_homepage"
    t.string   "application_url"
    t.datetime "ranked_at"
    t.boolean  "rank_up"
    t.boolean  "trainee_gefluester"
    t.boolean  "premium"
    t.boolean  "prolongate"
    t.datetime "prolongation_notified_at"
    t.string   "country"
    t.integer  "impressions_count",                  :default => 0
    t.boolean  "push"
    t.datetime "premium_ended_at"
    t.boolean  "suppress_automated_prolongation"
    t.string   "custom_permalink"
    t.string   "mode"
    t.string   "application_city"
    t.string   "application_country"
    t.string   "application_email"
    t.string   "application_method"
    t.string   "application_street"
    t.string   "application_zip"
    t.string   "contact_email"
    t.string   "contact_name"
    t.string   "contact_phone"
    t.string   "contact_position"
    t.boolean  "custom_application_address"
    t.string   "duration"
    t.datetime "earliest_start_date"
    t.datetime "latest_start_date"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "open_positions"
    t.text     "qualifications"
    t.string   "working_hours"
    t.boolean  "working_time_night"
    t.boolean  "working_time_weekend"
    t.boolean  "suppress_prolongation_notification"
  end

  add_index "job_offers", ["company_id"], :name => "index_job_offers_on_company_id"
  add_index "job_offers", ["ended_at"], :name => "index_job_offers_on_ended_at"
  add_index "job_offers", ["mode"], :name => "index_job_offers_on_mode"
  add_index "job_offers", ["recruiter_id"], :name => "index_job_offers_on_recruiter_id"
  add_index "job_offers", ["reference_number"], :name => "index_job_offers_on_reference_number"
  add_index "job_offers", ["started_at"], :name => "index_job_offers_on_started_at"
  add_index "job_offers", ["state"], :name => "index_job_offers_on_state"

  create_table "job_opportunities", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "job_opportunities", ["company_id"], :name => "index_job_opportunities_on_company_id"
  add_index "job_opportunities", ["position"], :name => "index_job_opportunities_on_position"

  create_table "job_position_mappings", :force => true do |t|
    t.integer  "jobplacement_id"
    t.integer  "mappable_id"
    t.string   "mappable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "job_position_mappings", ["jobplacement_id"], :name => "index_job_position_mappings_on_jobplacement_id"
  add_index "job_position_mappings", ["mappable_id", "mappable_type"], :name => "index_job_position_mappings_on_mappable_id_and_mappable_type"
  add_index "job_position_mappings", ["mappable_type"], :name => "index_job_position_mappings_on_mappable_type"

  create_table "job_specifications", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "job_specifications", ["company_id"], :name => "index_job_specifications_on_company_id"
  add_index "job_specifications", ["position"], :name => "index_job_specifications_on_position"

  create_table "jobplacements", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
  end

  add_index "jobplacements", ["permalink"], :name => "index_jobplacements_on_permalink"
  add_index "jobplacements", ["title"], :name => "index_jobplacements_on_title"

  create_table "landing_page_mappings", :force => true do |t|
    t.integer  "landing_page_id"
    t.integer  "associated_landing_page_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "landing_page_mappings", ["associated_landing_page_id"], :name => "index_landing_page_mappings_on_associated_landing_page_id"
  add_index "landing_page_mappings", ["landing_page_id"], :name => "index_landing_page_mappings_on_landing_page_id"

  create_table "landing_page_template_mappings", :force => true do |t|
    t.integer  "landing_page_id"
    t.integer  "landing_page_template_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "landing_page_template_mappings", ["landing_page_id", "landing_page_template_id"], :name => "index_landing_page_template_mappings_on_associates"

  create_table "landing_page_templates", :force => true do |t|
    t.string   "category"
    t.string   "area"
    t.text     "content"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "landing_page_templates", ["category", "area", "position"], :name => "index_landing_page_templates_on_category_and_area_and_position"

  create_table "landing_pages", :force => true do |t|
    t.string   "identifier"
    t.string   "title"
    t.string   "meta_keywords"
    t.text     "meta_description"
    t.string   "h1"
    t.string   "headline_1"
    t.string   "headline_2"
    t.string   "db_headline"
    t.text     "db_text"
    t.string   "job_offers_headline"
    t.text     "job_offers_text"
    t.string   "register_headline"
    t.text     "register_text"
    t.text     "success_story_1"
    t.text     "success_story_2"
    t.text     "success_story_3"
    t.string   "footer_headline"
    t.text     "footer_text_1"
    t.text     "footer_text_2"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "h3_1"
    t.string   "h3_2"
    t.string   "h3_3"
    t.string   "career_helper_headline"
    t.text     "career_helper_text"
    t.string   "success_story_image_1"
    t.string   "success_story_image_2"
    t.string   "success_story_image_3"
  end

  add_index "landing_pages", ["identifier"], :name => "index_landing_pages_on_identifier", :unique => true

  create_table "language_taxonomies", :force => true do |t|
    t.string   "title"
    t.string   "key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "language_taxonomies", ["key"], :name => "index_language_taxonomies_on_key"

  create_table "languages", :force => true do |t|
    t.string   "title"
    t.boolean  "business_level",       :default => false, :null => false
    t.text     "details"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "completion_value",     :default => 0
    t.string   "categorized_title"
    t.integer  "user_id"
    t.integer  "language_taxonomy_id"
  end

  add_index "languages", ["language_taxonomy_id"], :name => "index_languages_on_language_taxonomy_id"
  add_index "languages", ["title"], :name => "index_languages_on_title"
  add_index "languages", ["user_id", "position"], :name => "index_languages_on_user_id_and_position"

  create_table "lead_reclamations", :force => true do |t|
    t.string   "reference_number", :limit => 20
    t.string   "email"
    t.string   "name"
    t.string   "course"
    t.string   "mlp_number"
    t.string   "mlp_consultant"
    t.string   "mlp_office"
    t.string   "reason"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lead_reclamations", ["reference_number", "email"], :name => "index_lead_reclamations_on_reference_number_and_email"

  create_table "location_queries", :force => true do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "location_queries", ["address"], :name => "index_location_queries_on_address"

  create_table "logged_queries", :force => true do |t|
    t.string   "query"
    t.string   "location"
    t.integer  "results_count"
    t.text     "scat"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mode"
    t.string   "session_identifier"
  end

  add_index "logged_queries", ["mode"], :name => "index_logged_queries_on_mode"

  create_table "logos", :force => true do |t|
    t.integer  "company_id"
    t.string   "logo_content_type"
    t.string   "logo_file_name"
    t.integer  "logo_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "featured"
    t.datetime "logo_updated_at"
  end

  add_index "logos", ["company_id"], :name => "index_logos_on_company_id_and_parent_id"

  create_table "mail_notifications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "originator_id"
    t.string   "originator_type"
    t.string   "event"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "bounced_at"
    t.datetime "sent_at"
    t.text     "params"
    t.boolean  "automatic"
    t.boolean  "mass_mailing"
    t.string   "error"
    t.text     "log"
    t.datetime "updated_at"
  end

  add_index "mail_notifications", ["originator_id", "originator_type"], :name => "index_mail_notifications_on_originator_id_and_originator_type"
  add_index "mail_notifications", ["originator_type"], :name => "index_mail_notifications_on_originator_type"
  add_index "mail_notifications", ["user_id", "event"], :name => "index_mail_notifications_on_recipient_id_and_event"

  create_table "mailing_assets", :force => true do |t|
    t.string   "title"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mailing_assets", ["title"], :name => "index_mailing_assets_on_title"

  create_table "masks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "masks", ["company_id"], :name => "index_masks_on_company_id"
  add_index "masks", ["user_id", "company_id"], :name => "index_masks_on_user_id_and_company_id"

  create_table "medias", :force => true do |t|
    t.text     "content"
    t.string   "mediable_type"
    t.integer  "mediable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content_html"
    t.integer  "position"
  end

  add_index "medias", ["mediable_id", "mediable_type"], :name => "index_medias_on_mediable_id_and_mediable_type"
  add_index "medias", ["mediable_type"], :name => "index_medias_on_mediable_type"
  add_index "medias", ["position"], :name => "index_medias_on_position"

  create_table "mlp_college_cities", :force => true do |t|
    t.integer  "number"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mlp_college_study_subject_mappings", :force => true do |t|
    t.integer  "mlp_college_id"
    t.integer  "mlp_study_subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mlp_college_study_subject_mappings", ["mlp_college_id"], :name => "index_mlp_college_study_subject_mappings_on_mlp_college_id"
  add_index "mlp_college_study_subject_mappings", ["mlp_study_subject_id"], :name => "index_mlp_college_study_mappings_on_mlp_study_id"

  create_table "mlp_colleges", :force => true do |t|
    t.integer  "number"
    t.string   "name"
    t.integer  "mlp_college_city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mlp_colleges", ["mlp_college_city_id"], :name => "index_mlp_colleges_on_mlp_college_city_id"

  create_table "mlp_departments", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mlp_office_mappings", :force => true do |t|
    t.integer  "mlp_office_id"
    t.integer  "mlp_college_city_id"
    t.integer  "mlp_college_id"
    t.integer  "mlp_study_subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mlp_office_mappings", ["mlp_college_city_id"], :name => "index_mlp_office_mappings_on_mlp_college_city_id"
  add_index "mlp_office_mappings", ["mlp_college_id"], :name => "index_mlp_office_mappings_on_mlp_college_id"
  add_index "mlp_office_mappings", ["mlp_office_id"], :name => "index_mlp_office_mappings_on_mlp_office_id"
  add_index "mlp_office_mappings", ["mlp_study_subject_id"], :name => "index_mlp_office_mappings_on_mlp_study_subject_id"

  create_table "mlp_offices", :force => true do |t|
    t.integer  "number"
    t.string   "name"
    t.string   "office_leader"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.string   "street"
    t.string   "zip"
    t.string   "city"
    t.string   "office_hours"
    t.string   "country_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mlp_offices", ["name"], :name => "index_mlp_offices_on_name"
  add_index "mlp_offices", ["number"], :name => "index_mlp_offices_on_number"

  create_table "mlp_operating_areas", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mlp_positions", :force => true do |t|
    t.string   "title"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mlp_study_subjects", :force => true do |t|
    t.integer  "number"
    t.string   "name"
    t.integer  "mlp_college_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mlp_study_subjects", ["mlp_college_id"], :name => "index_mlp_study_subjects_on_mlp_college_id"

  create_table "moustaches", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "order_templates", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "recruiter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_templates", ["recruiter_id"], :name => "index_order_templates_on_recruiter_id"

  create_table "orders", :force => true do |t|
    t.text     "comment"
    t.text     "description"
    t.integer  "recruiter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
    t.string   "position"
    t.text     "next_steps"
    t.string   "beginning_at"
    t.boolean  "is_also_a_template"
    t.boolean  "screening_option"
    t.boolean  "cyquest_option"
    t.integer  "bucket_id"
    t.integer  "order_template_id"
    t.string   "state"
  end

  add_index "orders", ["bucket_id"], :name => "index_orders_on_bucket_id"
  add_index "orders", ["order_template_id"], :name => "index_orders_on_order_template_id"
  add_index "orders", ["recruiter_id"], :name => "index_orders_on_recruiter_id"
  add_index "orders", ["state"], :name => "index_orders_on_state"

  create_table "phone_calls", :force => true do |t|
    t.integer  "user_id"
    t.integer  "supervisor_id"
    t.datetime "created_at"
    t.string   "number"
    t.boolean  "successful"
    t.text     "details"
    t.datetime "updated_at"
    t.text     "lead_details"
  end

  add_index "phone_calls", ["user_id", "supervisor_id"], :name => "index_phone_calls_on_graduate_id_and_supervisor_id"

  create_table "photos", :force => true do |t|
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "parent_id"
    t.string   "content_type"
    t.string   "thumbnail"
    t.string   "original_filename"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "error_message"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.string   "secure_token"
  end

  add_index "photos", ["owner_id", "owner_type"], :name => "index_photos_on_owner_id_and_owner_type"
  add_index "photos", ["parent_id"], :name => "index_photos_on_parent_id"

  create_table "post_assets", :force => true do |t|
    t.string   "title"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_assets", ["title"], :name => "index_post_assets_on_title"

  create_table "post_categories", :force => true do |t|
    t.string   "title"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_categories", ["permalink"], :name => "index_post_categories_on_permalink"

  create_table "post_category_mappings", :force => true do |t|
    t.integer  "post_category_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_category_mappings", ["post_category_id", "post_id"], :name => "index_post_category_mappings_on_post_category_id_and_post_id"
  add_index "post_category_mappings", ["post_id"], :name => "index_post_category_mappings_on_post_id"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "publish_at"
    t.string   "state"
    t.string   "meta_keywords"
    t.text     "meta_description"
    t.integer  "supervisor_id"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author_name"
  end

  add_index "posts", ["permalink"], :name => "index_posts_on_permalink", :unique => true
  add_index "posts", ["supervisor_id"], :name => "index_posts_on_supervisor_id"
  add_index "posts", ["title"], :name => "index_posts_on_title"

  create_table "premium_contingents", :force => true do |t|
    t.integer  "company_id"
    t.integer  "recruiter_id"
    t.string   "state"
    t.integer  "open"
    t.integer  "amount"
    t.integer  "standard_price"
    t.decimal  "price",              :precision => 8, :scale => 2, :default => 0.0
    t.boolean  "special_conditions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "preselections", :force => true do |t|
    t.integer  "bucket_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "preselections", ["bucket_id"], :name => "index_favorites_on_bucket_id"
  add_index "preselections", ["user_id"], :name => "index_favorites_on_user_id"

  create_table "press_items", :force => true do |t|
    t.string   "title"
    t.datetime "published_at"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "press_items", ["owner_id", "owner_type"], :name => "index_press_items_on_owner_id_and_owner_type"
  add_index "press_items", ["owner_type"], :name => "index_press_items_on_owner_type"
  add_index "press_items", ["position"], :name => "index_press_items_on_position"

  create_table "price_models", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "monthly_fee",     :default => 0
    t.string   "identifier"
    t.boolean  "database_flat"
    t.boolean  "job_offers_flat"
  end

  create_table "profile_assets", :force => true do |t|
    t.string   "title"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "profile_assets", ["owner_id", "owner_type"], :name => "index_profile_assets_on_owner_id_and_owner_type"
  add_index "profile_assets", ["owner_type"], :name => "index_profile_assets_on_owner_type"
  add_index "profile_assets", ["position"], :name => "index_profile_assets_on_position"

  create_table "profile_details", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "profile_details", ["owner_id", "owner_type"], :name => "index_profile_details_on_owner_id_and_owner_type"
  add_index "profile_details", ["owner_type"], :name => "index_profile_details_on_owner_type"
  add_index "profile_details", ["position"], :name => "index_profile_details_on_position"

  create_table "profile_headers", :force => true do |t|
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profile_headers", ["owner_id", "owner_type"], :name => "index_profile_headers_on_owner_id_and_owner_type"
  add_index "profile_headers", ["owner_type"], :name => "index_profile_headers_on_owner_type"

  create_table "profile_insides", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "profile_insides", ["owner_id", "owner_type"], :name => "index_profile_insides_on_owner_id_and_owner_type"
  add_index "profile_insides", ["owner_type"], :name => "index_profile_insides_on_owner_type"
  add_index "profile_insides", ["position"], :name => "index_profile_insides_on_position"

  create_table "profilevisits", :force => true do |t|
    t.integer  "user_id"
    t.integer  "recruiter_id"
    t.datetime "created_at"
  end

  add_index "profilevisits", ["recruiter_id"], :name => "index_profilevisits_on_recruiter_id"
  add_index "profilevisits", ["user_id", "recruiter_id", "created_at"], :name => "index_profilevisits_on_graduate_id_and_recruiter_id"

  create_table "projects", :force => true do |t|
    t.string   "organization"
    t.string   "location"
    t.string   "job_title"
    t.date     "started_on"
    t.date     "finished_on"
    t.string   "focus"
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "completion_value", :default => 0
    t.integer  "user_id"
  end

  add_index "projects", ["user_id", "position"], :name => "index_projects_on_user_id_and_position"

  create_table "promotions", :force => true do |t|
    t.string   "promotable_type"
    t.integer  "promotable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "affiliate_user_id"
    t.integer  "affiliate_key_id"
  end

  add_index "promotions", ["affiliate_key_id"], :name => "index_promotions_on_affiliate_key_id"
  add_index "promotions", ["affiliate_user_id"], :name => "index_promotions_on_affiliate_user_id"
  add_index "promotions", ["promotable_id", "promotable_type"], :name => "index_promotions_on_promotable_id_and_promotable_type"

  create_table "recruiter_infos", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "link"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.boolean  "published"
    t.string   "css_class"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recruiters", :force => true do |t|
    t.string   "login",                                        :null => false
    t.string   "hashed_password",                              :null => false
    t.string   "salt",                                         :null => false
    t.string   "firstname",                                    :null => false
    t.string   "lastname",                                     :null => false
    t.string   "email",                                        :null => false
    t.string   "phone"
    t.string   "fax"
    t.string   "street"
    t.string   "zip"
    t.string   "city"
    t.string   "title"
    t.string   "mobile"
    t.string   "department"
    t.string   "position"
    t.datetime "logged_in_at"
    t.datetime "tos_confirmed_at"
    t.datetime "first_edit_invitation_sent"
    t.integer  "company_id",                                   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "notification",               :default => true
    t.boolean  "public_browsing",            :default => true
    t.datetime "login_hash_expire_on"
    t.string   "country"
    t.integer  "current_bucket_id"
    t.boolean  "admin"
    t.datetime "deleted_at"
    t.string   "api_key"
    t.integer  "api_calls"
    t.boolean  "editor_fallback"
  end

  add_index "recruiters", ["admin"], :name => "index_recruiters_on_admin"
  add_index "recruiters", ["api_key"], :name => "index_recruiters_on_api_key"
  add_index "recruiters", ["company_id"], :name => "index_recruiters_on_company_id"
  add_index "recruiters", ["current_bucket_id"], :name => "index_recruiters_on_current_bucket_id"
  add_index "recruiters", ["deleted_at"], :name => "index_recruiters_on_deleted_at"
  add_index "recruiters", ["email"], :name => "index_recruiters_on_email"
  add_index "recruiters", ["lastname"], :name => "index_recruiters_on_lastname"
  add_index "recruiters", ["login"], :name => "index_recruiters_on_login"

  create_table "recruiting_interests", :force => true do |t|
    t.string   "name"
    t.string   "company"
    t.string   "email"
    t.string   "phone"
    t.text     "interests"
    t.string   "employees"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "misc"
  end

  create_table "rejection_templates", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "recruiter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rejection_templates", ["recruiter_id"], :name => "index_rejection_templates_on_recruiter_id"

  create_table "rights", :force => true do |t|
    t.string   "controller", :limit => 100
    t.string   "action",     :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rights", ["action", "controller"], :name => "index_rights_on_action_and_controller"
  add_index "rights", ["controller"], :name => "index_rights_on_controller"

  create_table "role_rights", :force => true do |t|
    t.integer  "role_id"
    t.integer  "right_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "role_rights", ["right_id"], :name => "index_role_rights_on_right_id"
  add_index "role_rights", ["role_id"], :name => "index_role_rights_on_role_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "salaries", :force => true do |t|
    t.integer  "study_type"
    t.integer  "title_type"
    t.string   "title"
    t.integer  "lower_quartil"
    t.integer  "median"
    t.integer  "upper_quartil"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "salaries", ["study_type"], :name => "index_salaries_on_study_type"
  add_index "salaries", ["title"], :name => "index_salaries_on_title"
  add_index "salaries", ["title_type"], :name => "index_salaries_on_title_type"

  create_table "salary_analyses", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "sex"
    t.date     "birthdate"
    t.string   "participant_type"
    t.string   "state"
    t.integer  "course_registration_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "access_token"
    t.datetime "access_token_expires_at"
  end

  add_index "salary_analyses", ["course_registration_id"], :name => "index_salary_analyses_on_course_registration_id"
  add_index "salary_analyses", ["state"], :name => "index_salary_analyses_on_state"
  add_index "salary_analyses", ["user_id"], :name => "index_salary_analyses_on_user_id"

  create_table "salary_analysis_apprenticeships", :force => true do |t|
    t.string   "title"
    t.string   "organization"
    t.string   "location"
    t.date     "started_on"
    t.date     "finished_on"
    t.integer  "salary_analysis_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "salary_analysis_apprenticeships", ["salary_analysis_id"], :name => "index_salary_analysis_apprenticeships_on_salary_analysis_id"

  create_table "salary_analysis_current_companies", :force => true do |t|
    t.string   "title"
    t.string   "corporate_form"
    t.string   "amount_of_employees"
    t.integer  "mlp_department_id"
    t.string   "working_city"
    t.string   "working_zip"
    t.string   "hours_of_work"
    t.string   "staff_responsibility"
    t.string   "budget_responsibility"
    t.date     "job_started_at"
    t.date     "current_position_started_at"
    t.integer  "current_position_id"
    t.integer  "entry_position_id"
    t.integer  "current_operating_area_id"
    t.integer  "entry_operating_area_id"
    t.integer  "salary_analysis_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "salary_analysis_current_companies", ["salary_analysis_id"], :name => "index_salary_analysis_current_companies_on_salary_analysis_id"

  create_table "salary_analysis_current_salaries", :force => true do |t|
    t.string   "base_salary"
    t.string   "christmas_bonus"
    t.string   "holiday_bonus"
    t.string   "bonus"
    t.text     "company_pension_plan"
    t.text     "company_car"
    t.string   "capital_forming_payments"
    t.text     "substantial_savings"
    t.string   "apprenticeship_financing"
    t.text     "further_benefits"
    t.string   "complete_salary"
    t.string   "amount_of_salaries"
    t.string   "complete_salary_at_entry"
    t.integer  "salary_analysis_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "salary_analysis_current_salaries", ["salary_analysis_id"], :name => "index_salary_analysis_current_salaries_on_salary_analysis_id"

  create_table "salary_analysis_desired_companies", :force => true do |t|
    t.string   "company"
    t.string   "amount_of_employees"
    t.string   "city"
    t.string   "desired_salary"
    t.integer  "mlp_department_id"
    t.integer  "mlp_position_id"
    t.integer  "mlp_operating_area_id"
    t.integer  "salary_analysis_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "salary_analysis_desired_companies", ["salary_analysis_id"], :name => "index_salary_analysis_desired_companies_on_salary_analysis_id"

  create_table "salary_analysis_experiences", :force => true do |t|
    t.string   "company"
    t.string   "zip"
    t.string   "city"
    t.string   "duration"
    t.string   "salary"
    t.date     "started_at"
    t.date     "ended_at"
    t.integer  "mlp_operating_area_id"
    t.integer  "mlp_position_id"
    t.integer  "salary_analysis_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "salary_analysis_experiences", ["salary_analysis_id"], :name => "index_salary_analysis_experiences_on_salary_analysis_id"

  create_table "salary_analysis_international_experiences", :force => true do |t|
    t.string   "country"
    t.date     "started_on"
    t.date     "finished_on"
    t.text     "description"
    t.integer  "salary_analysis_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "salary_analysis_languages", :force => true do |t|
    t.string   "title"
    t.string   "details"
    t.integer  "salary_analysis_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "salary_analysis_languages", ["salary_analysis_id"], :name => "index_salary_analysis_languages_on_salary_analysis_id"

  create_table "salary_analysis_pay_increases", :force => true do |t|
    t.date     "increased_at"
    t.string   "increase_amount"
    t.string   "complete_salary"
    t.integer  "salary_analysis_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "salary_analysis_pay_increases", ["salary_analysis_id"], :name => "index_salary_analysis_pay_increases_on_salary_analysis_id"

  create_table "salary_analysis_pay_negotiations", :force => true do |t|
    t.boolean  "new_company"
    t.string   "company"
    t.string   "corporate_form"
    t.string   "amount_of_employees"
    t.string   "working_city"
    t.string   "working_zip"
    t.integer  "company_department_id"
    t.string   "staff_responsibility"
    t.string   "budget_responsibility"
    t.integer  "future_position_id"
    t.integer  "future_operating_area_id"
    t.integer  "salary_analysis_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "salary_analysis_pay_negotiations", ["salary_analysis_id"], :name => "index_salary_analysis_pay_negotiations_on_salary_analysis_id"

  create_table "salary_analysis_studies", :force => true do |t|
    t.string   "university_type"
    t.string   "university"
    t.string   "city"
    t.string   "faculty"
    t.string   "course_of_study"
    t.string   "major"
    t.string   "minor"
    t.string   "degree"
    t.string   "semesters"
    t.date     "finished_on"
    t.string   "pgrade"
    t.string   "grade"
    t.integer  "salary_analysis_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "salary_analysis_studies", ["salary_analysis_id"], :name => "index_salary_analysis_studies_on_salary_analysis_id"

  create_table "salary_analysis_working_experiences", :force => true do |t|
    t.string   "total_experience"
    t.text     "foreign_experience"
    t.integer  "company_changes"
    t.integer  "salary_analysis_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "salary_analysis_working_experiences", ["salary_analysis_id"], :name => "index_salary_analysis_working_experiences_on_salary_analysis_id"

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.date     "graduated_on"
    t.string   "major"
    t.string   "grade"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "completion_value",  :default => 0
    t.integer  "categorized_grade"
    t.integer  "user_id"
  end

  add_index "schools", ["user_id", "position"], :name => "index_schools_on_user_id_and_position"

  create_table "search_agent_mappings", :force => true do |t|
    t.integer  "recruiter_id"
    t.integer  "user_id"
    t.datetime "sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "search_agent_mappings", ["recruiter_id", "user_id"], :name => "index_search_agent_mappings_on_recruiter_id_and_user_id"
  add_index "search_agent_mappings", ["user_id"], :name => "index_search_agent_mappings_on_user_id"

  create_table "sector_mappings", :force => true do |t|
    t.integer  "sector_id"
    t.integer  "mappable_id"
    t.string   "mappable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sector_mappings", ["mappable_id", "mappable_type"], :name => "index_sector_mappings_on_mappable_id_and_mappable_type"
  add_index "sector_mappings", ["mappable_type"], :name => "index_sector_mappings_on_mappable_type"
  add_index "sector_mappings", ["sector_id"], :name => "index_sector_mappings_on_sector_id"

  create_table "sectors", :force => true do |t|
    t.string   "title"
    t.string   "identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "side_jobs", :force => true do |t|
    t.string   "organization"
    t.text     "description"
    t.string   "job_title"
    t.integer  "hours_per_week"
    t.integer  "position"
    t.boolean  "fulltime"
    t.date     "finished_on"
    t.date     "started_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "completion_value", :default => 0
    t.integer  "user_id"
  end

  add_index "side_jobs", ["user_id", "position"], :name => "index_side_jobs_on_user_id_and_position"

  create_table "snapshots", :force => true do |t|
    t.integer  "user_id"
    t.integer  "recruiter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "pdf_snippet"
    t.integer  "version",        :default => 0
    t.integer  "order_id"
    t.string   "title"
    t.string   "majors"
    t.string   "locations"
    t.string   "positions"
    t.integer  "activity"
    t.date     "available_from"
    t.integer  "photo_id"
  end

  add_index "snapshots", ["order_id"], :name => "index_snapshots_on_order_id"
  add_index "snapshots", ["photo_id"], :name => "index_snapshots_on_photo_id"
  add_index "snapshots", ["recruiter_id"], :name => "index_snapshots_on_recruiter_id"
  add_index "snapshots", ["user_id"], :name => "index_snapshots_on_graduate_id"

  create_table "social_benefits", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "social_benefits", ["company_id"], :name => "index_social_benefits_on_company_id"
  add_index "social_benefits", ["position"], :name => "index_social_benefits_on_position"

  create_table "social_medias", :force => true do |t|
    t.string   "url"
    t.string   "source"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "social_medias", ["owner_id", "owner_type"], :name => "index_social_medias_on_owner_id_and_owner_type"
  add_index "social_medias", ["owner_type"], :name => "index_social_medias_on_owner_type"
  add_index "social_medias", ["position"], :name => "index_social_medias_on_position"

  create_table "special_ads", :force => true do |t|
    t.string   "link"
    t.string   "linktext"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "studies", :force => true do |t|
    t.string   "university"
    t.string   "course_of_study"
    t.text     "major"
    t.text     "minor"
    t.date     "started_on"
    t.date     "finished_on"
    t.string   "grade"
    t.integer  "semesters"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "grade_estimated",        :default => false, :null => false
    t.boolean  "pgrade_estimated",       :default => false, :null => false
    t.string   "pgrade"
    t.integer  "completion_value",       :default => 0
    t.date     "estimated_finished_on"
    t.integer  "categorized_grade"
    t.integer  "user_id"
    t.integer  "degree_taxonomy_id"
    t.integer  "university_taxonomy_id"
    t.integer  "study_taxonomy_id"
  end

  add_index "studies", ["course_of_study"], :name => "index_studies_on_course_of_study"
  add_index "studies", ["degree_taxonomy_id"], :name => "index_studies_on_degree_taxonomy_id"
  add_index "studies", ["study_taxonomy_id"], :name => "index_studies_on_study_taxonomy_id"
  add_index "studies", ["university_taxonomy_id"], :name => "index_studies_on_university_taxonomy_id"
  add_index "studies", ["user_id", "position"], :name => "index_studies_on_user_id_and_position"

  create_table "study_taxonomies", :force => true do |t|
    t.string   "key"
    t.string   "title"
    t.integer  "parent_id"
    t.string   "category_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
  end

  add_index "study_taxonomies", ["ancestry"], :name => "index_study_taxonomies_on_ancestry"
  add_index "study_taxonomies", ["category_type", "parent_id"], :name => "index_study_taxonomies_on_category_type_and_parent_id"
  add_index "study_taxonomies", ["key"], :name => "index_study_taxonomies_on_key"
  add_index "study_taxonomies", ["parent_id"], :name => "index_study_taxonomies_on_parent_id"
  add_index "study_taxonomies", ["title"], :name => "index_study_taxonomies_on_title"

  create_table "study_taxonomy_mappings", :force => true do |t|
    t.integer  "study_taxonomy_id"
    t.integer  "mappable_id"
    t.string   "mappable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "study_taxonomy_mappings", ["mappable_id", "mappable_type"], :name => "index_study_taxonomy_mappings_on_mappable_id_and_mappable_type"
  add_index "study_taxonomy_mappings", ["mappable_type"], :name => "index_study_taxonomy_mappings_on_mappable_type"
  add_index "study_taxonomy_mappings", ["study_taxonomy_id"], :name => "index_study_taxonomy_mappings_on_study_taxonomy_id"

  create_table "subscriptions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriptions", ["company_id"], :name => "index_favorite_companies_on_company_id"
  add_index "subscriptions", ["user_id"], :name => "index_favorite_companies_on_graduate_id"

  create_table "supervisors", :force => true do |t|
    t.string   "login",           :null => false
    t.string   "hashed_password", :null => false
    t.string   "phone",           :null => false
    t.string   "mobile",          :null => false
    t.string   "firstname",       :null => false
    t.string   "lastname",        :null => false
    t.string   "email",           :null => false
    t.string   "salt",            :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
  end

  add_index "supervisors", ["email"], :name => "index_supervisors_on_email"
  add_index "supervisors", ["login"], :name => "index_supervisors_on_login"
  add_index "supervisors", ["role_id"], :name => "index_supervisors_on_role_id"

  create_table "support_requests", :force => true do |t|
    t.text     "content"
    t.string   "http_user_agent"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "firstname"
    t.string   "lastname"
  end

  add_index "support_requests", ["user_id"], :name => "index_support_requests_on_user_id"

  create_table "team_members", :force => true do |t|
    t.string   "name"
    t.string   "job_title"
    t.text     "description"
    t.string   "department"
    t.integer  "position"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "textkernel_caches", :force => true do |t|
    t.string   "key_type"
    t.string   "values"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "key"
  end

  add_index "textkernel_caches", ["key"], :name => "index_textkernel_caches_on_key"

  create_table "trainee_seal_interests", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "company"
    t.string   "phone"
    t.text     "message"
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trainee_seal_interests", ["email"], :name => "index_trainee_seal_interests_on_email"

  create_table "trainee_seal_violations", :force => true do |t|
    t.string   "email"
    t.integer  "company_id"
    t.string   "name"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trainee_seal_violations", ["company_id"], :name => "index_trainee_seal_violations_on_company_id"

  create_table "university_assistances", :force => true do |t|
    t.string   "university"
    t.string   "department"
    t.string   "supervisor"
    t.date     "started_on"
    t.date     "finished_on"
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "completion_value", :default => 0
    t.integer  "user_id"
  end

  add_index "university_assistances", ["user_id", "position"], :name => "index_university_assistances_on_user_id_and_position"

  create_table "university_taxonomies", :force => true do |t|
    t.string   "key"
    t.string   "title"
    t.string   "categorized_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "university_taxonomies", ["title"], :name => "index_university_taxonomies_on_title"

  create_table "user_infos", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "link"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.boolean  "published"
    t.string   "css_class"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_queries", :force => true do |t|
    t.integer  "recruiter_id"
    t.string   "title"
    t.string   "islength"
    t.string   "xlength"
    t.string   "wlength"
    t.string   "itime"
    t.string   "ugrade"
    t.string   "sgrade"
    t.string   "radius"
    t.string   "lang"
    t.string   "scat"
    t.string   "type"
    t.string   "degree"
    t.string   "sex"
    t.string   "pos"
    t.string   "dep"
    t.string   "age_min"
    t.string   "age_max"
    t.string   "afrom_min"
    t.string   "afrom_max"
    t.string   "university"
    t.string   "course_of_study"
    t.string   "major_minor"
    t.string   "internship"
    t.string   "other_experience"
    t.string   "experience"
    t.string   "intro"
    t.string   "misc"
    t.string   "qs"
    t.string   "city"
    t.string   "language"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "search_agent",     :default => false
    t.datetime "sent_at"
    t.string   "interval"
  end

  add_index "user_queries", ["recruiter_id"], :name => "index_user_queries_on_recruiter_id"
  add_index "user_queries", ["search_agent"], :name => "index_user_queries_on_search_agent"

  create_table "user_type_histories", :force => true do |t|
    t.string   "user_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_type_histories", ["user_id"], :name => "index_user_type_histories_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "login",                                                       :null => false
    t.string   "hashed_password",                                             :null => false
    t.string   "salt",                                                        :null => false
    t.string   "firstname"
    t.string   "lastname"
    t.string   "phone"
    t.string   "cellphone"
    t.string   "address"
    t.string   "zip"
    t.string   "city"
    t.string   "country"
    t.string   "email_verification_code"
    t.integer  "sex"
    t.date     "birthdate"
    t.datetime "email_verified_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_activated_at"
    t.datetime "tos_confirmed_at"
    t.date     "available_from"
    t.string   "email"
    t.string   "title"
    t.boolean  "opt_in",                                    :default => true
    t.integer  "completion_score",                          :default => 0
    t.date     "available_until"
    t.boolean  "jobletter_opt_in",                          :default => true
    t.datetime "email_verification_reminded_at"
    t.boolean  "active"
    t.integer  "total_experience"
    t.integer  "total_international_experience"
    t.integer  "total_internship"
    t.boolean  "eventletter_opt_in",                        :default => true
    t.string   "current_user_type"
    t.boolean  "feedletter_opt_in",                         :default => true
    t.datetime "email_verification_one_month_reminded_at"
    t.datetime "email_verification_six_months_reminded_at"
    t.string   "cyquest_user_report_url"
    t.integer  "feedletter_interval_in_days"
    t.datetime "cyquest_started_on"
    t.datetime "cyquest_finished_on"
    t.integer  "cyquest_contact_id"
    t.datetime "feedletter_sent_at"
    t.datetime "first_time_in_search"
    t.boolean  "show_cyquest"
    t.boolean  "welcome_notice"
    t.datetime "welcome_email_sent_at"
    t.datetime "email_verification_one_week_reminded_at"
    t.datetime "activity_reminded_at"
    t.datetime "end_of_study_reminded_at"
    t.datetime "success_mail_sent_at"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "users", ["active"], :name => "index_graduates_on_active"
  add_index "users", ["created_at"], :name => "index_graduates_on_created_at"
  add_index "users", ["email"], :name => "index_graduates_on_email"
  add_index "users", ["email_verification_code"], :name => "index_graduates_on_email_verification_code", :unique => true
  add_index "users", ["firstname"], :name => "index_users_on_firstname"
  add_index "users", ["lastname"], :name => "index_users_on_lastname"
  add_index "users", ["login"], :name => "index_graduates_on_login"

  create_table "zips", :force => true do |t|
    t.string  "code"
    t.float   "lng"
    t.float   "lat"
    t.integer "city_id"
  end

  add_index "zips", ["city_id"], :name => "index_zips_on_city_id"
  add_index "zips", ["code"], :name => "index_zips_on_code"

end
