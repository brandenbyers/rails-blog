require 'spec_helper'
 
 feature 'Posts' do
   scenario 'can be created' do
     visit new_post_path
     fill_in 'Title', with: 'Rails is Awesome!'
     fill_in 'Text', with: 'It really is.'
     click_button 'Save Post'
     expect(current_path).to eq post_path(Post.where(title: 'Rails is Awesome!').first)
   end
   
   scenario 'cannot be created without a title' do
     visit new_post_path
     fill_in 'Title', with: ''
     click_button 'Save Post'
     expect(page).to have_content("Title can't be blank")
   end
   
   scenario 'can get back to llist page from new page' do
     visit new_post_path
     click_link 'Back'
     expect(current_path).to eq posts_path
   end
   
   scenario 'can be accessed from link on home page' do
     visit root_path
     click_link 'My Blog'
     expect(current_path).to eq posts_path
   end
   
   scenario 'can be created from link on posts page' do
     visit posts_path
     click_link 'New post'
     expect(current_path).to eq new_post_path
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
     
     scenario 'can get back to list page from show page' do
       visit post_path(Post.first)
       click_link 'Back'
       expect(current_path).to eq posts_path
     end
   end
 end