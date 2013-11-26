Feature:  To allow someone else to caption a photo
          As an existing submitter of photos
          I need to be able to submit a photo

          Background: ecomba@makers.com is logged in
               Given I am on the homepage

          Scenario: When not logged in and navigating to submiting photo page
               Given I am not logged in 
               And I click "Submit a photo"
               Then I should see "You need to be logged in to submit a photo"

          Scenario: Navigating to submitting photo page
               Given "Enrique" signs up
               And I click "Submit a photo"
               Then I should see "Submit new photo"

          Scenario: Submit a photo
               Given "Enrique" signs up
               And I click "Submit a photo"
               And I fill in "Description" with "fuck off delete unicorn"
               Then I attach file "cats.jpg"
               And I press "Save description"
               Then I should see "fuck off delete unicorn"
               And I should see "Submitted by ecomba@makers.com"
               And the "alt" tag of CSS "img.uploaded-pic" should not be "missing"

               
               

