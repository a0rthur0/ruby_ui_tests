Given(/^I am on a bookstore page$/) do
  @navigation = NavigationBlock.new(@browser)
  @navigation.open_homepage
end

When(/^I click login button$/) do
  visit(LoginPage)
end

Then /^I should see page title$/ do
  on(LoginPage).check_title_exist
end

And(/^I enter "([^"]*)" in email field$/) do |email|
  on(LoginPage).enter_login(email)
end

And(/^I enter "([^"]*)" in password field$/) do |password|
  on(LoginPage).enter_password(password)
end

And(/^I click complete login button$/) do
  on(LoginPage).complete_login
end

And(/^I choose Top_test Category with books$/) do
  on(CategoryPage).open_test_category
end

And(/^I click Add to cart first book (\d+)$/) do |book_number|
  on(CategoryPage).buy_books(book_number)
end


And(/^I click Add to cart second book (\d+)$/) do |book_number|
  on(CategoryPage).buy_books(book_number)
end

And(/^I click on Cart button$/) do
  @navigation.click_to_open_cart
end

Then(/^I should see "([^"]*)"$/) do |expected_cart|
  on(CartPage).verify_cart_text(expected_cart)
end
