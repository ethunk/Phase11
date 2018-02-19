require "rails_helper"
require 'orderly'
require 'faker'
require 'spec_helper'

feature "User views all questions index" do
  # As a user
  # I want to view a question's details
  # So that I can effectively understand the question
  #
  # Acceptance Criteria
  #
  # - I must be able to get to this page from the questions index
  # - I must see the question's title
  # - I must see the question's description

  before :each do
    5.times do
      Question.create(title: Faker::Book.title, description: [Faker::Lorem.sentence(10,true,10),Faker::Lorem.sentence(10,true,10)].join(". "))
    end
  end


  it "view a questions details" do
    visit '/questions'
    question_1 = Question.first
    click_on(question_1.title)
    expect(page).to have_content(question_1.title)
    expect(page).to have_content(question_1.description)
  end
end
