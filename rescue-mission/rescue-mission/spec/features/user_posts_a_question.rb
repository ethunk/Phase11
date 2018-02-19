require "rails_helper"
require 'orderly'
require 'faker'
require 'spec_helper'

feature "User posts a question" do
  # As a user
  # I want to post a question
  # So that I can receive help from others
  #
  # Acceptance Criteria
  #
  # - I must provide a title that is at least 20 characters long
  # - I must provide a description that is at least 50 characters long
  # - I must be presented with errors if I fill out the form incorrectly

  # end

  it "posts a valid question" do
    visit 'questions/new'
    title = 'x'* 21 #to meet the >40 chr req.
    description = 'd' * 51 #to meet the >150 chr. req.
    fill_in('Title', with: title)
    fill_in('Description', with: description)
    click_on "Submit Question"

    expect(page).to have_content("Question posted sucessfully")
    expect(page).to have_content(title)
    expect(page).to have_content(description)
  end

  it "posts a invalid question" do
    visit 'questions/new'
    title = 'x'* 19 #to meet the >40 chr req.
    description = 'd' * 49 #to meet the >150 chr. req.
    fill_in('Title', with: title)
    fill_in('Description', with: description)
    click_on "Submit Question"

    expect(page).to have_content("Title is too short (minimum is 20 characters)")
    expect(page).to have_content("Description is too short (minimum is 50 characters)")
  end

end
