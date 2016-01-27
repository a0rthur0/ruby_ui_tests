class LoginPage
  include PageObject
  text_field(:email_for_login, :id => 'user_name')
  text_field(:pass_for_login, :id => 'password')
  button(:click_complete_login, :value => 'Login')
  h1(:login_page_title, :text => 'Login')

  page_url("https://retail.circlesoft.net/auth/login")

  def check_title_exist
    login_page_title?
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
end