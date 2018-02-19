require "rails_helper"
require 'orderly'
require 'faker'
require 'spec_helper'

feature "User views all questions index" do
  # As a user
  # I want to write my questions and answers with markdown
  # So I can easily format my questions and answers
  #
  # Acceptance Criteria
  #
  # - I can write my questions and answers using markdown syntax
  # - Questions and answers, when shown, should be the HTML rendered from the
  #   markdown


  it "questions and answer written in markdown are displayed correctly" do
    visit 'question/new'
    fill_in('Title', with: '#This title should be displayed as an H1 header')
    fill_in('Description', with: 'This is a description of the answer that is long enough to meet the validation requirement')
    click_on('Save Question')
    visit('questions/1')
    expect(page.html).to have_content('<h1>This title should be displayed as an H1 header</h1>')
    fill_in('Description', with: '#This title should be displayed as an H1 header and be 50 characters long')
    click_on('Submit')
    expect(page.html).to have_content('<h1>This title should be displayed as an H1 header and be 50 characters long</h1>')
  end
end
