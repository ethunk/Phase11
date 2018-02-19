require "rails_helper"
require 'orderly'
require 'faker'
require 'spec_helper'

feature "User answers a question" do

  # As a user
  # I want to answer another user's question
  # So that I can help them solve their problem
  #
  # Acceptance Criteria
  #
  # - I must be on the question detail page
  # - I must provide a description that is at least 50 characters long
  # - I must be presented with errors if I fill out the form incorrectly
  before :each do
    10.times do
      Question.create(title: Faker::Book.title, description: [Faker::Lorem.sentence(10,true,10),Faker::Lorem.sentence(10,true,10)].join(". "))
    end
  end

  it 'answer submission form is on the details page.' do
    question_1 = Question.first
    visit "question/#{question_1.id}"
    expect(page).to have_content('Enter Answer Title')
    expect(page).to have_content('Describe Your Answer')
  end

  it 'answer will only be accepted if description is longer than 50 characters' do

  end


end
