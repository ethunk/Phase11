class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    if @answer.save
      flash[:notice] = "Answer submitted sucessfully"
      redirect_to question_path(@answer.question_id)
    else
      render :template => 'questions/show'
    end
  end
end


private

def answer_params
  params.require(:answer).permit(:description)
end
