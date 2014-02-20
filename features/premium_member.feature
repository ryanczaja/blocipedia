Feature: As a user, I should be able to become a premium user

	Scenario: As a user, I want to be able to become a premium user.
		Given a "User" exists with attributes: "email": "test@email.com", "password": "password"
		And a User is logged in with attributes: "email": "test@email.com", "password": "password"
		And I go to the root page
		When I click 'Upgrade to Premium'
		When I click on element with css selector '.stripe-button-el'
		And I fill in 'Card Number' with '4242424242424242'
		And I fill in 'Expiration' with '0618'
		And I fill in 'CVC' with '012'
		When I click 'Submit Payment'
		Then a User should be a premium user