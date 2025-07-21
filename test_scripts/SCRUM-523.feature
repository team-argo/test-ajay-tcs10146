# Language: en
@ui @regression @about-us
Feature: About Us Page Functionality

  As a potential patient, partner, or job applicant,
  I want to explore the 'About Us' page
  So that I can understand the company's mission, team, and key metrics to build trust and make an informed decision.

  Background:
    Given I am on the "About Us" page

  @navigation @smoke
  Scenario: Navigate to the Services page from the header
    When I click the "Services" link in the main navigation header
    Then I should be redirected to the "/services" page
    And the page title should be "Our Services"

  @content @visual
  Scenario: View the company's mission and values
    When I view the introduction section at the top of the page
    Then I should see the company mission statement
    And I should see a primary graphic or video about the company journey

  @team @data-driven
  Scenario Outline: Verify key personnel are displayed correctly
    When I scroll to the "Key People" section
    Then I should see the staff member "<Name>" in the leadership table
    And their role should be listed as "<Role>"
    And their location should be listed as "<Location>"

    Examples:
      | Name              | Role                     | Location          |
      | Dr. Jane Smith    | Chief Medical Officer    | New York, NY      |
      | John Doe          | Chief Executive Officer  | Chicago, IL       |
      | Emily White       | Head of Patient Care     | San Francisco, CA |

  @metrics @data-driven
  Scenario Outline: Verify company metrics are displayed on cards
    When I view the company metrics section
    Then I should see a card with the title "<Metric>"
    And the card should display a value for that metric

    Examples:
      | Metric                 |
      | Founded                |
      | Patients Served        |
      | Clinic Locations       |
      | Patient Satisfaction   |

  @footer @contact
  Scenario: Verify company contact information in the footer
    When I scroll to the bottom of the page
    And I view the page footer
    Then I should see the company's physical address
    And I should see the company's contact phone number or email

  @footer @legal @navigation
  Scenario Outline: Verify footer navigation links
    When I click the "<Link Text>" link in the footer
    Then I should be redirected to the "<URL Path>" page

    Examples:
      | Link Text      | URL Path         |
      | Privacy Policy | /privacy-policy  |
      | Terms of Use   | /terms-of-use    |
      | Contact Us     | /contact         |