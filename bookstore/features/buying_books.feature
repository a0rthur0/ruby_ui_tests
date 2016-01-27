Feature: As a registered user I buy 2 books

  Scenario: Buying 2 book after login
    Given I am on a bookstore page
    When I click login button
    Then I enter "testa@last.name" in login and "df" in pass and login
    When I choose Top_test Category with books
    Then I click Add to cart first book 1
    And I click Add to cart second book 2
    When I click on Cart button
    Then I should see "2 items in the cart"
