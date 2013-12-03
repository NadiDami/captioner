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

Then(/^the "(.*?)" tag of CSS "(.*?)" should be "(.*?)"$/) do |tag, css, text|
  pic = page.find css
  expect(pic[tag]).to eq text 
end

def create_a_user
  click_link 'Create account'
  fill_in :user_email, :with => 'ecomba@makers.com' 
  fill_in 'Password', with:'password' 
  fill_in :user_password_confirmation, with: 'password'
  click_button 'Create account'
end

def upload_new_photo(submit = true, photo_one = true)
  click_link 'Submit a photo'
  if photo_one == true
    attach_file 'Photo', Rails.root.join("spec/_assets/cats.png")
    fill_in 'Description', with: "fuck off delete unicorn"
  else
    attach_file 'Photo', Rails.root.join("spec/_assets/dogs.png")
    fill_in 'Description', with: "the delete unicorn lives on"
  end
  click_button 'Save photo' if submit
end

Given(/^"(.*?)" signs up and submits a photo$/) do |submitter|
  create_a_user
  upload_new_photo
end

Given(/^"(.*?)" signs up and submits a photo with tags$/) do |submitter|
  create_a_user
  upload_new_photo(false)
  fill_in 'Tags', with: "cute animals"
  click_button 'Save photo'
end

Given(/^"(.*?)" submits a second photo with tags$/) do |submitter|
  upload_new_photo(false, false)
  fill_in 'Tags', with: "dogs"
  click_button 'Save photo'
end


