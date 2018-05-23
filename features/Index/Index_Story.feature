Feature: User reads cartoon
  As an user
  In order to read about my cartoon
  I would like to be able to see text and images from the cartoon

 Scenario: Go to the root page to read
   Given I am on the index page
   Then I should see "Thor"
   And I should see "Data provided by Marvel. © 2018 MARVEL"
   And I should see Cover image
   
