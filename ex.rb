require "rubygems"
require "test/unit"
require "watir-webdriver"
require "page-object"

class Header
  include PageObject
  link(:sign_up_button, :xpath => '//a[@href="/auth/register"]')
  link(:logout_button, :xpath => '//a[@href="/auth/logout"]')
  link(:login_button, :xpath => '//a[@href="/auth/login"]')
  link(:cart_button, :xpath => '//a[@href="/cart"]')

  def click_signup_link
    sign_up_button
    SignUp.new(@browser)
  end

  def click_login_link
    login_button
    LogIn.new(@browser)
  end

  def click_logout_link
    logout_button
    LogIn.new(@browser)
  end

  def click_cart_button
    cart_button
    CartPage.new(@browser)
  end

end

class Categoriez
  include PageObject
  links(:category_table, :xpath => '//div[@class="side-list categories in collapse"]//a')

  def random_category_order
    array = []
    category_table_elements.each do |a|
      array << a.text
    end
    rand(0...array.length)
  end

  def click_random_category
    index = self.random_category_order
    category_table_elements[index].click
    ListBooks.new(@browser)
  end
end

class ListBooks
  include PageObject
  div(:root, :class => 'product-list productlistingcontainer')
  divs(:addable_books, :xpath => '//div[//a[contains(@class,"button  add-to-cart")] and @class="product"]')
  link(:add_to_cart, :xpath => '//a[contains(@class,"button  add-to-cart")]')

  def add_to_cart_random_book
    random_index = rand(0..addable_books_elements.length)
    book_block = addable_books_elements[random_index]
    book_name = book_block.h2(:xpath => '//div[@class="product-title"]/h2')
    book_block.link(:xpath => '//a[contains(@class,"button  add-to-cart")]').click
  end

  def is_addable_books_exist
    add_to_cart?
  end

end

class LogIn
  include PageObject

  text_field(:login_name, :name => "user_name")
  text_field(:login_password, :name => "password")

  def fill_form_login(login_name, login_password)
    self.login_name = login_name
    self.login_password = login_password
  end

  def click_login_link
    login_button
  end

  def fill_form_login_and_login (login_name, login_password)
    self.login_name = login_name
    self.login_password = login_password
    click_login_link
  end
end

class SignUp
  include PageObject
  text_field(:first, :name => "account[first_name]")
  text_field(:last, :name => "account[last_name]")
  text_field(:email, :name => "account[email]")
  text_field(:pass, :name => "account[password]")
  text_field(:repass, :name => "account[password_confirmation]")
  button(:complete_signup, :xpath => '//form[@id="newUser"]//input[@name="commit"]')

  def fill_form(first, last, email, pass, repass)
    self.first = first
    self.last = last
    self.email = email
    self.pass = pass
    self.repass = repass
  end

  def click_signup
    complete_signup
    SignUp.new(@browser)
  end

  def fill_form_and_sign_up(first, last, email, pass, repass)
    self.fill_form(first, last, email, pass, repass)
    self.click_signup
  end

  def logout_after_signup
    logout_button
  end

end

class CartPage
    include PageObject
    divs(:books_names_in_cart, :xpath => '//div[@class="product-title"]')

    def list_books_in_cart
      array_books = []
      books_names_in_cart_elements.each do |a|
      array_books << a.text
    end
    end
  end

class SignupTest < Test::Unit::TestCase
  def setup
    @browser ||= Watir::Browser.new :firefox
    @browser.driver.manage.window.maximize

  end

  def teardown
    @browser.close
  end

  def test_full_cycle
    @browser.goto("http://retail.circlesoft.net/")
    sign_up_page = Header.new(@browser).click_signup_link
    sign_up_page.fill_form_and_sign_up("d", "d", "z0xz59aszc@gcs.gs", "df", "df")
    cat_page = Categoriez.new(@browser)

    def add_random_book(cat_page)
      book_list_page  = cat_page.click_random_category
      while not book_list_page.is_addable_books_exist do
        @browser.back
        add_random_book(cat_page)
      end
      name = book_list_page.add_to_cart_random_book
    end

    books = []
    for i in 0..1
      puts i
      books << add_random_book(cat_page)
      @browser.goto("http://retail.circlesoft.net/")
    end
    cart_page = Header.new(@browser).click_cart_button
    expected_books = cart_page.list_books_in_cart
    if expected_books.to_set == books.to_set && expected_books.length == books.length
      puts "Books are the same"
    else puts "Failed to compare books"
    end

  end

end
