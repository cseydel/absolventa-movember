config = (YAML.load_file('config/amazon_s3.yml')[Rails.env] rescue {}).symbolize_keys
# use config vars in production (as documented on heroku)
if Rails.env.production?
  config[:access_key_id] = ENV['S3_KEY']
  config[:secret_access_key] = ENV['S3_SECRET']
end

S3_CONFIG = config.freeze
