Feature:  To allow someone else to caption a photo
          As an existing submitter of photos
          I need to be able to submit a photo

          Background: ecomba@makers.com is logged in
               Given I am on the homepage

          Scenario: Navigating to submitting photo page
               Given "Enrique" signs up
               And I click "Submit a photo"
               Then I should see "Submit new photo"

          Scenario: When not logged in and navigating to submiting photo page
               Given I am not logged in 
               And I click "Submit a photo"
               Then I should see "You need to be logged in to submit a photo"


