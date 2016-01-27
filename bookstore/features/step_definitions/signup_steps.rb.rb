Given(/^Bookstore homepage$/) do
  @navigation = NavigationBlock.new(@browser)
  @navigation.open_homepage
end

When(/^I click on signup button$/) do
  @navigation.click_signup_link
end

Then(/^I should see signup page$/) do
 on(SignupPage).check_title_for_signup_page
end

When(/^I enter "([^"]*)" as first name, "([^"]*)" as last, "([^"]*)", and "([^"]*)" as password "([^"]*)"$/) do |firstname, lastname, email, pass, repass|
 on(SignupPage).fill_forms_only(firstname, lastname, email, pass, repass)
end

Then(/^I click on complete singup button$/) do
 on(SignupPage).click_to_complete_signup
end

And(/^I should see success message$/) do
 on(SignupPage).check_success_signup_warning
end