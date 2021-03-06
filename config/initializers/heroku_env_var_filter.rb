# filter heroku environment parameters for exceptional
if defined?(Exceptional::ENVIRONMENT_FILTER)
  ['CONSOLE_AUTH',
   'CROND_URL',
   'DATABASE_URL',
   'LOGGLY_URL',
   'EXCEPTIONAL_API_KEY',
   'HEROKU_POSTGRESQL_BROWN_URL',
   'HEROKU_POSTGRESQL_NAVY_URL',
   'HEROKU_POSTGRESQL_GRAY_URL',
   'MEMCACHE_PASSWORD',
   'MEMCACHE_USERNAME',
   'NEW_RELIC_LICENSE_KEY',
   'PGBACKUPS_URL',
   'S3_KEY',
   'S3_SECRET',
   'SCHEDULER_URL',
   'SENDGRID_PASSWORD',
   'SENDGRID_USERNAME',
   'SHARED_DATABASE_URL',
   'WEBSOLR_URL'].each do |constant|
     Exceptional::ENVIRONMENT_FILTER << constant
  end
end