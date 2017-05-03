class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    @url = "http:// localhost:3000/login"
    mail to: @user.email, subject: t("account_activation")
  end

  def password_reset user
    @user = user
    mail to: user.email, subject: t("reset_pw")
  end
end
