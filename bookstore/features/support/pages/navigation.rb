class NavigationBlock
  include PageObject
  link(:sign_up_button, :xpath => '//a[@href="/auth/register"]')
  link(:logout_button, :xpath => '//a[@href="/auth/logout"]')
  link(:login_button, :xpath => '//a[@href="/auth/login"]')
  link(:cart_button, :xpath => '//a[@href="/cart"]')

  def open_homepage
    @browser.goto 'http://retail.circlesoft.net/'
  end

  def click_login_link
    login_button
  end

  def click_signup_link
    sign_up_button
  end

  def click_logout_link
    logout_button
  end

  def click_to_open_cart
    cart_button
  end

  def check_logout_button_appears
    if logout_button? == true
      puts "Login successfull"
      else puts "Failed check login success"
    end
  end

end