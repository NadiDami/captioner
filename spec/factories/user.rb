FactoryGirl.define do
  factory(:user) do
    email 'ecomba@makers.com'
    password 'password'
    password_confirmation 'password'
  end
end