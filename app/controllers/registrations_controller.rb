class RegistrationsController < Devise::RegistrationsController
  def create
    super
    UserMailer.delay.welcome_email(@user) unless @user.invalid?
  end
end