When(/^I press "(.*?)"$/) do |arg1|
  click_on arg1
end

When(/^I fill in "(.*?)" for "(.*?)"$/) do |arg1, arg2|
  fill_in arg2, with: arg1
end

Then(/^I should see "(.*?)" within "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end
