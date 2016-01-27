Feature: As I guest I'm trying to create an account

  Scenario: I'm creating an account
    Given Bookstore homepage
    When I click on signup button
    Then I should see signup page
    When I enter "Azaza" as first name, "Test" as last, "123t@email.email", and "qwerty" as password "qwerty"
    Then I click on complete singup button
    And I should see success message
