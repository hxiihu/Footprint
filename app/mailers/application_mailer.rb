class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@footprint.com"
  layout 'mailer'
end
