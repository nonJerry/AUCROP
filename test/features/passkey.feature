Feature: Passkey Authentication

  Scenario: User logs in with an existing passkey
    Given I am on the login page
    And I see the "Sign in with passkey" option
    When I select the "Sign in with passkey" option
    And I authenticate using my passkey
    Then I am logged in
    And I am redirected to the home page

  Scenario: User registers a passkey for future logins
    Given I am logged in to the application
    And my device supports passkeys
    When I navigate to the account settings page
    And I select the option to register a passkey
    And I complete the passkey creation process
    Then my passkey is registered
    And I see the message "Your passkey has been successfully registered."

  Scenario: Passkey registration requires additional verification
    Given I am logged in to the application
    And my device supports passkeys
    When I navigate to the account settings page
    And I attempt to register a passkey
    Then I am prompted to verify my password or complete multi-factor authentication
    And after successful verification
    And I complete the passkey creation process
    Then my passkey is registered
    And I see the message "Your passkey has been successfully registered."

  Scenario: Passkey login option is unavailable on unsupported devices
    Given I am on the login page
    And my device does not support passkeys
    When I look for the "Sign in with passkey" option
    Then I do not see the "Sign in with passkey" option

  Scenario: User fails to authenticate with their passkey
    Given I am on the login page
    And I select the "Sign in with passkey" option
    When I fail the passkey authentication process
    Then I remain on the login page
    And I see the error message "Unable to authenticate using the passkey. Please try again or use another login method."

  Scenario: User deletes their registered passkey
    Given I am logged in to the application as user with a passkey
    When I navigate to the account settings page
    And I select the option to delete my registered passkey
    And I confirm the deletion
    Then my passkey is deregistered
    And I see the message "Your passkey has been successfully removed."

  Scenario: User renames their registered passkey
    Given I am logged in to the application as user with a passkey
    When I navigate to the account settings page
    And I select the option to rename my registered passkey
    And I provide a new name for the passkey
    Then the name of my passkey is updated
    And I see the message "Your passkey name has been updated."

  Scenario: User fallbacks to password login when passkey authentication fails
    Given I am on the login page
    And I select the "Sign in with passkey" option
    And passkey authentication fails
    When I select the "Or sign in with password" option
    And I enter my username and password
    And I log in successfully
    Then I am redirected to the home page
    And I see the message "You are logged in."

  Scenario: Passkey login is disabled for unauthorized users
    Given I am on the login page
    And I see the "Sign in with passkey" option
    When I attempt to login with a passkey that is not registered on my account
    Then I see the error message "Unable to authenticate using the passkey. Please try again or use another login method."
    And I remain on the login page