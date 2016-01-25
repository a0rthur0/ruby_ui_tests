Given(/^I am on a books website$/) do
  @browser.goto("http://retail.circlesoft.net/")
end

When(/^I click on signup button$/) do
  @sign_up_page = Header.new(@browser).click_signup_link
end

And(/^Enter registration data and complete registration$/) do
  @sign_up_page.fill_form_and_sign_up("Ar", "ddf", "8zmnx@1i6ak.gs", "df", "df")
end

Then(/^I should see "([^"]*)"$/) do |expected|
  @browser.text.should include expected
end

And(/^I click on a random categories and buy 2 books$/) do
  @cat_page = Categoriez.new(@browser)
  def add_random_book
    book_list_page = @cat_page.click_random_category
    while not book_list_page.is_addable_books_exist do
      @browser.back
    end
    name = book_list_page.add_to_cart_random_book
  end

  @books = []
      for i in 0..1
        @books << add_random_book
        @browser.goto("http://retail.circlesoft.net/")
      end
end

And(/^I click on cart button$/) do
  @cart_page = Header.new(@browser).click_cart_button
end

# Then(/^I should see books that I've bought$/) do
#   if @browser.text.include?(@books) then puts "Books OK"
#     else puts "Books differs"
#   end
# end

Then(/^I should see books that I've bought$/) do
  expected_books = @cart_page.list_books_in_cart
  if expected_books.length == @books.length
    puts "Books are the same"
  else puts "Failed to compare books"
    end
end