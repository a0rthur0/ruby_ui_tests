require 'watir-webdriver'



Before do
  @browser = Watir::Browser.new :firefox
  @browser.driver.manage.window.maximize


end


After do
  @browser.close
end