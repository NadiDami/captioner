Feature: Homepage structure
          In order to use the captioner
          As a visitor of the site
          I need a kickass UI

        Background: The homepage
                Given I am on the homepage

        Scenario: The title
                Then I should see "Captioner"

        Scenario: Create account and Sign in
                Then I should see "Create account"
                Then I should see "Sign in"
                And I click "Create account"
                Then I should see "Create new account"