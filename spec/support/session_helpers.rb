def log_in(user)
  visit new_user_session_path

  within 'form.new_user' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'

    click_link_or_button 'Sign in'
  end

  user
end