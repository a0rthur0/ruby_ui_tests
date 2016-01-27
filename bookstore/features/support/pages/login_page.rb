class LoginPage
  include PageObject
  text_field(:email_for_login, :id => 'user_name')
  text_field(:pass_for_login, :id => 'password')
  button(:click_complete_login, :class => 'btn')
  h1(:login_page_title, :text => 'Login')
  p(:check_successful_login_warning, :id => 'flash_success')

  page_url("https://retail.circlesoft.net/auth/login")

  def check_title_exist
    if login_page_title? == false
      fail('Can\'t check login page title')
    end
  end

  def check_success_login_warning
    if check_successful_login_warning? == false
      fail('Can\'t check success login message')
    end
  end

  def enter_login(email_for_login)
    self.email_for_login = email_for_login
  end

  def enter_password(password)
    self.pass_for_login = password
  end

  def complete_login
    click_complete_login
  end

  def fill_form_and_login (email_for_login, pass_for_login)
    self.email_for_login = email_for_login
    self.pass_for_login = pass_for_login
    click_complete_login
  end
end