require 'spec_helper'
 
 feature 'Posts' do
   scenario 'can be created' do
     visit new_post_path
     fill_in 'Title', with: 'Rails is Awesome!'
     fill_in 'Text', with: 'It really is.'
     click_button 'Save Post'
     expect(page).to have_content('Rails is Awesome!')
   end
 end