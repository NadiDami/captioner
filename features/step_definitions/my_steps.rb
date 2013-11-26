Then(/^I click "(.*?)"$/) do |link|
    # puts page.html

  click_link link
end

When(/^"(.*?)" signs up$/) do |submitter|
  click_link 'Create account'
  fill_in :user_email, :with => 'ecomba@makers.com' 
  fill_in 'Password', with:'password' 
  fill_in :user_password_confirmation, with: 'password'
  click_button 'Create account'
end

Given(/^"(.*?)" is logged in$/) do |submitter|
  click_link 'Sign in'
  fill_in :user_email, :with => 'ecomba@makers.com' 
  fill_in 'Password', with:'password' 
  click_button 'Sign in'
end


Given(/^I am not logged in$/) do
  page.driver.submit :delete, destroy_user_session_path, {}
end

Then(/^I attach file "(.*?)"$/) do |file|
  attach_file 'Photo', Rails.root.join("spec/_assets/#{file}")
end


Then(/^the "(.*?)" tag of CSS "(.*?)" should not be "(.*?)"$/) do |tag, css, text|
  pic = page.find css
  expect(pic[tag]).not_to eq text
end



    # pic = page.find 'img.uploaded-pic'
    # expect(pic['alt']).not_to eq 'Missing'