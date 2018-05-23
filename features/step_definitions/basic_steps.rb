Given(/^I am on the index page$/) do
  visit root_path
end

Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content(content)
end

Then(/^I should see Cover image$/) do
  expect(page).to have_xpath("//img[contains(@src,'ttp://i.annihil.us/u/prod/marvel/i/mg/c/50/5af36a7ec325e.jpg')]")
end
