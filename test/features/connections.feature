Feature: Platform connections

  Scenario: Adding a new OAuth connection successfully
    Given I am on the "Connections" settings page
    When I click the "Add Patreon" button
    And I authenticate with my Patreon account
    Then the OAuth connection is added
    And I see the message "Connection successfully added."
    And I see the new connection in the list of connections

  Scenario: Canceling the OAuth connection process
    Given I am on the "Connections" settings page
    When I click the "Add Patreon" button
    And I cancel the authentication process
    Then the connection is not added
    And I see the message "Connection was not added."

  Scenario: No Button for already added connection
    Given I already have an OAuth connection for "Patreon"
    And I am on the "Connections" settings page
    Then I see no "Add Patreon" button

  Scenario: Adding an Connection without completing authentication
    Given I am on the "Connections" settings page
    When I click the "Add Patreon" button
    And I do not complete the authentication process
    Then the OAuth connection is not added
    And I remain on the "Connections" settings page

  Scenario: Viewing a list of existing Connections
    Given I am on the "Connections" settings page
    When I view the list of Connections
    Then I see all providers I have connected

  Scenario: Removing an existing OAuth connection
    Given I have an active OAuth connection for "Patreon"
    And I am on the "Connections" settings page
    When I click the "Remove" button for the "Patreon" connection
    And I confirm the removal
    Then the OAuth connection is removed
    And I see the message "OAuth connection successfully removed."

  Scenario: Failing to add an OAuth connection due to an invalid response
    Given I am on the "Connections" settings page
    When I click the "Add Patreon" button
    And the authentication response is invalid
    Then I see the error message "Failed to connect the Patreon account. Please try again."
    And the OAuth connection is not added

  Scenario: Re-adding a removed OAuth connection
    Given I had previously added and removed an OAuth connection for "Patreon"
    And I am on the "Connections" settings page
    When I click the "Add Patreon" button
    And I authenticate with my Patreon account
    Then the OAuth connection is added again