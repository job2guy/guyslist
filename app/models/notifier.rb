class Notifier < ActionMailer::Base
  def password_reset_instructions(user)
    subject      "Password Reset Instructions From Heroku App"
    from         "guy2job@gmail.com"
    recipients   user.email
    content_type "text/html"
    sent_on      Time.now 
    body         :edit_password_reset_url => edit_password_reset_url(user.id)
  end
end
