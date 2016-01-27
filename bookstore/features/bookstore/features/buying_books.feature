Feature: As a guest I login and buy 2 books

  Scenario: Buying 2 book after login
    Given I am on a bookstore page
    When I click login button
    Then I should see page title
    And I enter "testa@last.name" in email field
    And I enter "df" in password field
    And I click complete login button
    And I choose Top_test Category with books
    And I click Add to cart first book 1
    And I click Add to cart second book 2
    And I click on Cart button
    Then I should see "2 items in the cart"
