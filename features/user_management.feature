Feature: In order to be able to submit a photo
        As a new or existing user of the site
        I need to be able to sign up

        Background: No user logged in
                Given I am on the homepage

        Scenario: Signing up
                When "Enrique" signs up
                Then I should see "Hi, ecomba@makers.com"