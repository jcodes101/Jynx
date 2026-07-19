class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch("MAILER_SENDER", "noreply@jynx.fly.dev")
  layout "mailer"
end
