require "rails_helper"
require 'orderly'
require 'faker'
require 'spec_helper'
require 'pry'

feature "User views all questions index" do
  # As a user
  # I want to view recently posted questions
  # So that I can help others
  #
  # Acceptance Criteria
  #
  # - I must see the title of each question
  # - I must see questions listed in order, most recently posted first

  before :each do
    5.times do
      Question.create(title: Faker::Book.title, description: [Faker::Lorem.sentence(10,true,10),Faker::Lorem.sentence(10,true,10)].join(". "))
    end


  end


  it "sees the questions in order" do
    visit '/questions'
    question_1 = Question.first
    question_2 = Question.second
    question_last = Question.last
    expect(page).to have_content(question_1.title)
    expect(page).to have_content(question_2.title)
    expect(page).to have_content(question_last.title)
  end

end


# Time.now can be used to update the created at...or you could just create a new question...
