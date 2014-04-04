require 'spec_helper'
 
 feature 'The world' do
   scenario 'sees Hello, Rails!' do
     visit '/'
     expect(page).to have_content('Hello, Rails!')
   end
 end