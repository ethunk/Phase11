require "rails_helper"
require 'orderly'
require 'faker'
require 'spec_helper'

feature "User edits a question" do
  # As a user
  # I want to delete a question
  # So that I can delete duplicate questions
  #
  # Acceptance Criteria
  #
  # - I must be able delete a question from the question edit page
  # - I must be able delete a question from the question details page
  # - All answers associated with the question must also be deleted


  before :each do
    5.times do
      Question.create(title: Faker::Book.title, description: [Faker::Hacker.say_something_smart,Faker::Hacker.say_something_smart].join(". "))
    end
  end



  it 'delete a question from the edit page' do
    question = Question.first
    visit "questions/#{question.id}"
    click_on 'Edit Question'
    expect(page).to have_content('Delete Question')
    click_on 'Delete Question'

    expect(page).not_to have_content(question.title)
  end

  it 'delete a question from the details page' do
    question = Question.first
    visit "questions/#{question.id}"
    click_on 'Delete Question'
    expect(page).not_to have_content(question.title)
  end

  it 'answers for that question must also be deleted' do
    10.times do
      Answer.create(description: [Faker::Hacker.say_something_smart,Faker::Hacker.say_something_smart].join(". "), question_id: [1,2,3,4,5].sample)
    end
    question = Question.first
    visit "questions/#{question.id}"
    previous_answers_count = question.answers.count
    click_on 'Delete Question'

    expect(page).not_to have_content(question.title)
    expect((Answer.where("question_id = #{question.id}")).empty?).to be(true)

  end

end
