class CategoryPage
  include PageObject
  link(:open_test_category, :text => 'Top_test')
  links(:add_to_cart, :xpath => '//a[contains(@class,"button  add-to-cart")]')

  page_url ("http://retail.circlesoft.net/catalog/46945-Toptest")

  def category_click
   test_category
  end

  def buy_books(book_number)
    index = book_number.to_i
    add_to_cart_elements[index].click
  end
end