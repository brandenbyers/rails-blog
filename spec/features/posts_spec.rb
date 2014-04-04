require 'spec_helper'
 
 feature 'Posts' do
   scenario 'can be created' do
     visit new_post_path
     fill_in 'Title', with: 'Rails is Awesome!'
     fill_in 'Text', with: 'It really is.'
     click_button 'Save Post'
     expect(page).to have_content('Rails is Awesome!')
   end
   
   context 'when there are posts' do
     before do
       create :post, title: 'My first post'
       create :post, title: 'My second post'
     end
     
     scenario 'can be listed' do
       visit posts_path
       expect(page).to have_content('My first post')
       expect(page).to have_content('My second post')
     end
   end
   
 end