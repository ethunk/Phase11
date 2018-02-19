require "rails_helper"
require 'orderly'
require 'faker'
require 'spec_helper'

feature "User edits a question" do
  # As a user
  # I want to edit a question
  # So that I can correct any mistakes or add updates
  #
  # Acceptance Criteria
  #
  # - I must provide valid information
  # - I must be presented with errors if I fill out the form incorrectly
  # - I must be able to get to the edit page from the question details page

  before :each do
    5.times do
      Question.create(title: Faker::Book.title, description: [Faker::Hacker.say_something_smart,Faker::Hacker.say_something_smart].join(". "))
    end
  end


  it 'has a link to edit from the details page' do
    question = Question.first
    visit "questions/#{question.id}"
    bbyebug
    expect(page).should have_content('Edit Question')
  end

  it 'only accepts valid information and presents errors when not' do
    question = Question.first
    visit "questions/#{question.id}"
    click_on 'Edit Question'
    fill_in('Title', with: title)
    fill_in('Description', with: description)
    click_on "Submit Question"
    expect(page).to have_content('The following errors occured:')
  end

end
