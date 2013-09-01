Feature: Adding an IRC network
  As a user
  In order to chat with others
  I can join an IRC network

    Scenario: Adding freenode to my networks
      Given I am logged in
      When I press "Add Network"
      And I fill in "Freenode" for "name"
      And I fill in "wright.freenode.net" for "servers"
      And I press "Save"
      Then I should see "Freenode" within "#networks"
