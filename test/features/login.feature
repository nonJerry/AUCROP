Feature: Login

  Scenario Outline: Successful login
    Given I am on the login page
    When I enter the credentials <user> and <password>
    And I click the login button
    Then I am redirected to the homepage
    And I see a welcome message
    And I am logged in as <user>

    Examples:
      | user                | password       |
      | example@example.com | ExamplePass!23 |
      | example             | ExamplePass1!3 |

  Scenario Outline: Login with invalid password
    Given I am on the login page
    When I enter the credentials <user> and <password>
    And I click the login button
    Then I stay on the login page
    And I see the error message "User or password are incorrect."

    Examples:
      | user                | password       |
      | example@example.com | ExamplePass1!3 |
      | example             | ExamplePass!23 |


  Scenario: Login with invalid username
    Given I am on the login page
    When I enter an invalid username and a valid password
    And I click the login button
    Then I am on the login page
    And I see the error message "User or password are incorrect."

  Scenario: Password masking during input
    Given I am on the login page
    When I focus on the password field
    And I type my password
    Then I see the password is masked

  Scenario: Successful logout after login
    Given I am logged in as a user
    When I click the logout button
    Then I am redirected to the login page
    And I see the message "You have been logged out."

  Scenario: Login button disabled without credentials
    Given I am on the login page
    When I do not enter any username or password
    Then the login button should be disabled

  Scenario: Remember Me functionality
    Given I am on the login page
    When I enter my username and password
    And I check the "Remember Me" option
    And I log in successfully
    Then my credentials should be remembered the next time I visit the login page

  Scenario: Account lock after multiple failed attempts
    Given I am on the login page
    When I enter invalid credentials three times in a row
    Then I see the error message "Your account has been locked due to multiple failed login attempts. Please try again later or contact support."

  Scenario: Redirect to previous page after successful login
    Given I am on a restricted page
    And I am redirected to the login page
    When I log in successfully
    Then I am redirected back to the restricted page
