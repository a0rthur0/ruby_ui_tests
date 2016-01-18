require "rubygems"
require "test/unit"
require "watir-webdriver"
require "page-object"
class Header
  include PageObject
  link(:sign_up_button, :xpath => '//a[@href="/auth/register"]')

  def click_signup_link
    sign_up_button
    SignUp.new(@browser)
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
    book_name
  end

  def is_addable_books_exist
    add_to_cart?
  end


end

class SignUp
  include PageObject
  text_field(:first, :name => "account[first_name]")
  text_field(:last, :name => "account[last_name]")
  text_field(:email, :name => "account[email]")
  text_field(:pass, :name => "account[password]")
  text_field(:repass, :name => "account[password_confirmation]")
  button(:sign_up_button, :xpath => '//*[@id="newUser"]/div[4]/input')

  def fill_form(first, last, email, pass, repass)
    self.first = first
    self.last = last
    self.email = email
    self.pass = pass
    self.repass = repass
  end

  def click_signup
    sign_up_button
    SignUp.new(@browser)
  end

  def fill_form_and_sign_up(first, last, email, pass, repass)
    self.fill_form(first, last, email, pass, repass)
    self.click_signup
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

  # def test_01_registration
  #   link = Links.new(@browser)
  #   home = link.main_page
  #   signup = link.signup_link
  #   user_data = signup.sign_up("random_name","random_lastname","1a123@gmail.ru","qwerty","qwerty")
  # end

  # def test_02_signup
  #   link = Links.new(@browser)
  #   home = link.main_page
  #   login = link.login_link
  #   user_data = login.log_in("1a123@gmail.ru", "qwerty")
  # end

  def test_03_category
    def add_random_book_to_cart(cat_page)

    end
    @browser.goto("http://retail.circlesoft.net/")
    #sign_up_page = Header.new(@browser).click_signup_link
    #sign_up_page.fill_form_and_sign_up("d", "d", "gs@gs.gs", "df", "df")
    cat_page = Categoriez.new(@browser)
    def add_random_book(cat_page)
      book_list_page  = cat_page.click_random_category
      while not book_list_page.is_addable_books_exist do
        @browser.back
        add_random_book(cat_page)
      end
      name = book_list_page.add_to_cart_random_book.text
      name
    end
    books = []
    for i in 0..1
      puts i
      books << add_random_book(cat_page)
      @browser.goto("http://retail.circlesoft.net/")
    end

  end

end
