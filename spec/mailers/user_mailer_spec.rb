require "spec_helper"

describe UserMailer do
  describe 'welcome email' do
    let(:user) { create(:user) }
    let(:mail) { UserMailer.welcome(user) }

    it 'sets the subject' do
      expect(mail.subject).to eql('Welcome')
    end

    it 'sets the receipient' do
     expect(mail.to).to include(user.email)
    end

    it 'sets the body' do
      expect(mail.body.encoded).to include('registered')
    end
  end
end
