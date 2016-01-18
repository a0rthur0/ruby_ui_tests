require "rubygems"
require "test/unit"
require "watir-webdriver"
require "page-object"

class Links
  include PageObject
  link(:sign_up_button, :xpath => '//a[@href="/auth/register"]')
  link(:login_button, :xpath => '//a[@href="/auth/login"]')
  div(:category_table, :class => 'side-list categories in collapse')

      def initialize
        @class_book_instance = add_to_cart
      end

      def main_page
        browser.goto "http://retail.circlesoft.net/"
      end

      def signup_link
        sign_up_button
        SignUp.new(@browser)
      end

      def login_link
        login_button
        LogIn.new(@browser)
      end

      def category_choose
        a = rand(0..10)
        category_table_element.as[a].click
        Links.new(@browser)
        #Books.new(@browser)
      end

      def books_go_to_buy
        @class_book_instance.buy_book
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

    def sign_up (first, last, email, pass, repass)

      self.first = first
      self.last = last
      self.email = email
      self.pass = pass
      self.repass = repass
      sign_up_button
      SignUp.new(@browser)
    end
  end

  class LogIn
    include PageObject

    text_field(:login_name, :name => "user_name")
    text_field(:login_password, :name => "password")
    button(:login_button, :xpath => '//*[@id="inner-container"]/div/div[2]/div[2]/fieldset/form[1]/div[3]/div/input[2]')

    def log_in (login_name, login_password)
      self.login_name = login_name
      self.login_password = login_password
      login_button
      LogIn.new(@browser)
    end

    class Book
      include PageObject
      button(:add_to_cart, :name => 'Add to Cart')
      link(:book_name, :xpath => '//*[@id="show_products"]/div[1]/div[2]/div[1]/div[1]/div[1]/div/h2/a')

      def buy_book
        add_to_cart
      end
    end

  end
#################################
  class SignupTest < Test::Unit::TestCase
    def setup
      @browser ||= Watir::Browser.new :firefox
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
      link = Links.new(@browser)
      home = link.main_page
      home_cat = link.category_choose
      cat_chooser = home_cat.category_table
      ###### buying book
      go_to_book = link.books_go_to_buy
      bying = go_to_book.add_to_cart
      unless @browser.text.include? 'Add to Cart'
        then bying
        sleep(15)
      end
    end
  end
