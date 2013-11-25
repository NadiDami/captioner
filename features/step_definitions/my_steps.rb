Then(/^I click "(.*?)"$/) do |link|
  click_link link
end

When(/^"(.*?)" signs up$/) do |submitter|
  click_link 'Create account'
  fill_in :user_email, :with => 'ecomba@makers.com' 
  fill_in 'Password', with:'password' 
  fill_in :user_password_confirmation, with: 'password'
  click_button 'Create account'
end