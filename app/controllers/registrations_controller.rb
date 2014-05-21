class RegistrationsController < ApplicationController
  def create
      super
      UserMailer.delay.welcome(@user) unless @user.invalid?
    end
end