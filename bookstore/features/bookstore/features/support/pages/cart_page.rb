class CartPage
  include PageObject

  page_url ("https://retail.circlesoft.net/cart")

  def verify_cart_text(name)
    @browser.text.include?(name)
  end
end