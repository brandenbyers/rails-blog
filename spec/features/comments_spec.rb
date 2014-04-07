require 'spec_helper'
 
 feature 'Comments' do
   let(:user) { create :user }
   
   background do
     log_in user
     
     @comment = build :comment, body: 'This is the comment', user: user
     @post = create :post
     @post.comments << @comment
     @post.save
   end
 
   scenario 'can be added when viewing a post' do
     visit post_path(@post)
     fill_in 'Commenter', with: 'Concerned Citizen'
     fill_in 'Body', with: 'Great post!'
     click_button 'Create Comment'
     expect(current_path).to eq post_path(@post)
     expect(page).to have_content('Comment: Great post!')
   end
   
   scenario 'can be deleted', js: true do
     visit post_path(@post)
     expect(page).to have_content 'This is the comment'
     page.driver.accept_js_confirms!
     click_link 'Destroy Comment'
     expect(page).not_to have_content 'This is the comment'
   end
 end