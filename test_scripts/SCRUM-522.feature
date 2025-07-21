# language: en
@contact-page @regression
Feature: Healthcare Services Contact Page
  As a potential or existing patient
  I want to view and interact with the contact page
  So that I can find information, get answers to my questions, and get in touch with the provider.

  Background: User is on the Contact Page
    Given the user is on the healthcare services homepage
    When the user navigates to the "Contact" page

  @smoke @hero-section
  Scenario: Verify the content and call-to-action in the Hero section
    Then the user should see the main heading "Contact Our Team"
    And the user should see introductory text explaining how to get in touch
    And the user should see a "Let's Connect" button that scrolls to the contact form

  @faq
  Scenario: User can expand and collapse an FAQ item
    Given the user is viewing the "Frequently Asked Questions" section
    When the user clicks on the question "Do you accept my insurance?"
    Then the answer for "Do you accept my insurance?" should be visible
    And the other FAQ answers should remain hidden
    When the user clicks on the question "Do you accept my insurance?" again
    Then the answer for "Do you accept my insurance?" should be hidden

  @form-submission @happy-path
  Scenario Outline: Successfully submit the contact form with valid information
    Given the user is at the contact form section
    When the user enters "<FirstName>" in the First Name field
    And the user enters "<LastName>" in the Last Name field
    And the user selects the gender "<Gender>"
    And the user chooses "<Reason>" as the reason for contact
    And the user clicks the "Submit" button
    Then the user should see a success message "Thank you for your message. We will be in touch shortly."
    And the form fields should be cleared

    Examples:
      | FirstName | LastName | Gender             | Reason                  |
      | Jane      | Doe      | Female             | New Patient Inquiry     |
      | John      | Smith    | Male               | Billing Question        |
      | Alex      | Ray      | Prefer not to say  | Follow-up Appointment   |

  @form-validation @negative-path
  Scenario: Attempt to submit the contact form with a missing required field
    Given the user is at the contact form section
    When the user enters "Peter" in the First Name field
    And the user enters "Jones" in the Last Name field
    And the user clicks the "Submit" button
    Then the form should not be submitted
    And the user should see an error message "Please select a reason for contact." next to the reason field

  @footer @smoke
  Scenario: Verify the information and links in the website footer
    When the user scrolls to the footer of the page
    Then the footer should contain the address "123 Health St, Wellness City, ST 12345"
    And the footer should contain the phone number "(555) 123-4567"
    And the footer should contain a link to the "Privacy Policy" page
    And the footer should contain a link to the "Terms of Use" page