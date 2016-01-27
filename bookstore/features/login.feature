Feature: As a guest I'm trying to login

  Scenario: As guest I'm creating account
    Given I am on a bookstore home page
    When I click on login button
    Then I should see login page
    When I enter email "testa@last.name" in email field
    And I enter password "df" in password field
    And I click on button to complete login
    Then I should see success login warning
    And I should see logout button