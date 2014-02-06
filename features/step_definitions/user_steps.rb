Given(/^I do not have an account$/) do
  true
end

Given(/^I do have an accout$/) do
  true
end

Given(/^a (\w+) is logged in with attributes: (.+)$/) do |model, attributes|
	attributes = attributize_string(attributes)
end