Feature: As a user, I should be able to create Wikis with Markdown

	Scenario: As a user, I want to be able to create wiki pages using Markdown syntax.
		Given a "User" exists with attributes: "email": "test@email.com", "password": "password"
		And a User is logged in with attributes: "email": "test@email.com", "password": "password"
		And I go to the wikis page
		When I click 'New Wiki'
		Given I go to the new_wiki page
		When I fill in 'Title' with 'This is a new *Wiki*'
		And I fill in 'Body' with 'This is the **body** of the new Wiki'
		And I click 'Save'
		Then A Wiki should have been created with: "title": "This is a new *Wiki*", "body": "This is the **body** of the new Wiki"


