Given(/^I am on a bookstore home page$/) do
  @navigation = NavigationBlock.new(@browser)
  @navigation.open_homepage
end

When(/^I click on login button$/) do
  @navigation.click_login_link
end

Then(/^I should see login page$/) do
  on(LoginPage).check_title_exist
end

When (/^I enter email "([^"]*)" in email field$/) do |email|
  on(LoginPage).enter_login(email)
end

And(/^I enter password "([^"]*)" in password field$/) do |password|
  on(LoginPage).enter_password(password)
end

And(/^I click on button to complete login$/) do
  on(LoginPage).complete_login
end

Then(/^I should see success login warning$/) do
  on(LoginPage).check_success_login_warning
end

And(/^I should see logout button$/) do
  @navigation.check_logout_button_appears
end