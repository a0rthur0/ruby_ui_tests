class SignupPage
  include PageObject
  text_field(:first, :id => 'user_first_name')
  text_field(:last, :id => 'user_last_name')
  text_field(:email, :id => 'account_email')
  text_field(:pass, :id => 'account_password')
  text_field(:repass, :id => 'account_password_confirmation')
  button(:complete_signup, :class => 'create_button btn btn-warning')
  h1(:check_title, :text => 'Registration')
  p(:check_successful_signup_warning, :id => 'flash_success')

 page_url("https://retail.circlesoft.net/auth/register")

  def click_to_complete_signup
    complete_signup
  end

  def check_title_for_signup_page
    if check_title? == false
      fail('Failed to check signup page title')
    end
  end

  def check_success_signup_warning
    if check_successful_signup_warning? == false
      fail('Can\'t check success signup message')
    end
  end

  def fill_forms_only(first, last, email, pass, repass)
    self.first = first
    self.last = last
    self.email = email
    self.pass = pass
    self.repass = repass
  end

  def fill_forms_and_sign_up(first, last, email, pass, repass)
    self.fill_form(first, last, email, pass, repass)
    self.click_signup
  end


  def logout_after_signup
    logout_button
  end

end