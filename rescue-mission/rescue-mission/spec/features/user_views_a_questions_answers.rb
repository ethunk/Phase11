require "rails_helper"
require 'orderly'
require 'faker'
require 'spec_helper'
require 'pry'

feature "User views all questions index" do
  # As a user
  # I want to view the answers for a question
  # So that I can learn from the answer
  #
  # Acceptance Criteria
  #
  # - I must be on the question detail page
  # - I must only see answers to the question I'm viewing
  # - I must see all answers listed in order, most recent last

  # before :each do
  #   5.times do
  #     Question.create(title: Faker::Book.title, description: [Faker::Lorem.sentence(10,true,10),Faker::Lorem.sentence(10,true,10)].join(". "))
  #   end
  # end


  it "sees answers for a question on the detail page" do
  end

  it 'sees only answers to the questions im viewing' do
  end

  it 'sees answers listed in order with most recent last' do
  end

end


# Time.now can be used to update the created at...or you could just create a new question...
