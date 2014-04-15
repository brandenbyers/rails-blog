class RegistrationsController < Devise::RegistrationsController
  def create
    super
    UserMailer.delay.welcome(@user) unless @user.invalid?
  end
end