class MailInterceptor
  def self.delivering_email(message)
    message.to = APP_CONFIG[:development_recipient]
    message.cc = nil
    message.bcc = nil
  end
end