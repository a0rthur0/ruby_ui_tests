Given(/^I am on a bookstore page$/) do
  @navigation = NavigationBlock.new(@browser)
  @navigation.open_homepage
end

When(/^I click login button$/) do
  @navigation.click_login_link
end

Then /^I enter "([^"]*)" in login and "([^"]*)" in pass and login$/ do |email, password|
  on(LoginPage).fill_form_and_login(email, password)
end

When (/^I choose Top_test Category with books$/) do
  on(CategoryPage).open_test_category
end

Then(/^I click Add to cart first book (\d+)$/) do |book_number|
  on(CategoryPage).buy_books(book_number)
end


And(/^I click Add to cart second book (\d+)$/) do |book_number|
  on(CategoryPage).buy_books(book_number)
end

When(/^I click on Cart button$/) do
  @navigation.click_to_open_cart
end

Then(/^I should see "([^"]*)"$/) do |expected_cart|
  on(CartPage).verify_cart_text(expected_cart)
end
