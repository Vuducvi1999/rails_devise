class AuthMailer < ApplicationMailer
  # confirm after signup an account
  def confirm_sign_up
    @greeting = "Hi"

    mail to: "to@example.org"
  end
  # send link reset password to email client
  def forgot_password
    @greeting = "Hi"

    mail to: "to@example.org"
  end
  # send link to unlock account if try to sign in too many times
  def unlock_email
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
