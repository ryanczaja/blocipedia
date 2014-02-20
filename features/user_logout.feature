Feature: As a user I should be able to log out 

	Scenario: As a user, I want to be able to sign out of the Blocipedia.
		Given a "User" exists with attributes: "email": "test@email.com", "password": "password"
		And a User is logged in with attributes: "email": "test@email.com", "password": "password"
		And I go to the root page
		When I click on element with css selector "a[label='Sign Out']"
		Then a User should have logged out