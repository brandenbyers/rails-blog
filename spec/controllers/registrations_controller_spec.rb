require 'spec_helper'

describe RegistrationsController do
  it 'should call UserMailer welcome' do
    expect(@user).to receive (:welcome)  
  end
end
