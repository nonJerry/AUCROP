Feature: Internationalization (i18n)

  Scenario: Auto-detection of language from browser settings
    Given my browser is set to "Japanese"
    When I navigate to the home page
    Then the page content should be displayed in Japanese 

  Scenario: Fallback to English when browser language is unsupported
    Given my browser is set to "French"
    When I navigate to the home page
    Then the page content should be displayed in English 

  Scenario: Home page content is displayed in Japanese
    Given my browser is set to "Japanese"
    When I navigate to the home page
    Then the header should read "ホームページ"
    And the footer should read "お問い合わせ"

  Scenario: Login page content is displayed in English (fallback)
    Given my browser is set to "French"
    When I navigate to the login page
    Then the login title should read "Login"
    And the login button should read "Sign in"

  Scenario: Login page content is displayed in Japanese
    Given my browser is set to "Japanese"
    When I navigate to the login page
    Then the login title should read "ログイン"
    And the login button should read "サインイン"

  Scenario: Language switching functionality (manual override)
    Given I am on the home page
    And my browser language is set to "Japanese"
    When I use the language switcher to select "English"
    Then the page should reload in English
    And the header should read "Home Page"
    And the footer should read "Contact Us"

  Scenario: Default language fallback when browser language configuration is missing
    Given my browser does not send any language preference
    When I navigate to the login page
    Then the login title should read "Login"
    And the login button should read "Sign in"

  Scenario: Persisting language preference across pages
    Given I am on the home page in "Japanese"
    When I navigate to the login page
    Then the login title should read "ログイン"
    And the login button should read "サインイン"

  Scenario: User changes browser settings and revisits the page
    Given my browser is set to "English"
    When I change my browser language to "Japanese"
    And I refresh the home page
    Then the header should read "ホームページ"

  Scenario: Home page content is displayed in German
    Given my browser is set to "German"
    When I navigate to the home page
    Then the header should read "Startseite"
    And the footer should read "Kontakt"

  Scenario: Login page content is displayed in German
    Given my browser is set to "German"
    When I navigate to the login page
    Then the login title should read "Anmelden"
    And the login button should read "Einloggen"

  Scenario: Ensure proper fallback when language file is missing
    Given my browser is set to "German"
    And the German translation file is corrupted or unavailable
    When I navigate to the home page
    Then the page content should fallback to English
    And the header should read "Home Page"
    And the footer should read "Contact Us"

  Scenario: Error messages are displayed in the correct language
    Given my browser is set to "German"
    When I navigate to the login page
    And I enter incorrect login credentials
    Then I should see the error message "Benutzername oder Passwort ist falsch"