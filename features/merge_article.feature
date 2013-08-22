Feature: Merge Article
  As a blog administrator
  In order to simplify the articles on the blog site
  I want to merge articles on the same topic that say similar things

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    Given I am on the new article page
    When I fill in "article_title" with "Good tests"
    And I fill in "article__body_and_extended_editor" with "Shine bright"
    And I press "Publish"
    Given I am on the new article page
    When I fill in "article_title" with "Bad tests"
    And I fill in "article__body_and_extended_editor" with "At night"
    And I press "Publish"
   
  Scenario: Successfully merge articles
    Given I am on the admin content page
    When I follow "Good tests"
    Then I should be on the edit article page for "Good tests"
    When I fill in "Article ID" with "4"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "Good tests"
    And I should not see "Bad tests"
    
  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Given I am on the admin content page
    When I follow "Good tests"
    Then I should be on the edit article page for "Good tests"
    When I fill in "Article ID" with "4"
    And I press "Merge"
    Then I should be on the admin content page
    When I follow "Good tests"
    Then I should see "Shine bright"
    And I should see "At night"
  
  Scenario: A non-admin cannot merge two articles
    Given I am on the home page
    Then I should not see "Merge"  
  

  
