require 'spec_helper'
 
 feature 'Comments' do
   background do
     @post = create :post
   end
 
   scenario 'can be added when viewing a post' do
     visit post_path(@post)
     fill_in 'Commenter', with: 'Concerned Citizen'
     fill_in 'Body', with: 'Great post!'
     click_button 'Create Comment'
     expect(current_path).to eq post_path(@post)
     expect(page).to have_content('Comment: Great post!')
   end
 end