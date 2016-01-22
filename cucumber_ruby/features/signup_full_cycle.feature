Feature: Register new user and buy 2 books

  Scenario:
    Given I am on a books website
    When I click on signup button
    And Enter registration data and complete registration
    Then I should see "Signed up successfully."
    And I click on a random categories and buy 2 books
    And I click on cart button
    Then I should see books that I've bought

