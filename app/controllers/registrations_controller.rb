class RegistrationsController < Devise::RegistrationsController
  def create
    super
    UserMailer.delay.welcome(@user)
  end
end