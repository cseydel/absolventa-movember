erb_config = ERB.new(File.read("#{Rails.root.to_s}/config/config.yml")).result
APP_CONFIG = (YAML.load(erb_config)[Rails.env] rescue {}).symbolize_keys

if Rails.env.production? or Rails.env.staging?
  ActionMailer::Base.smtp_settings = {
    address:        'smtp.sendgrid.net',
    port:           '587',
    authentication: :plain,
    user_name:      ENV['SENDGRID_USERNAME'],
    password:       ENV['SENDGRID_PASSWORD'],
    domain:         'heroku.com'
  }
  ActionMailer::Base.delivery_method = :smtp
elsif Rails.env.development?
  ActionMailer::Base.delivery_method = :sendmail
  Mail.register_interceptor(MailInterceptor)
end