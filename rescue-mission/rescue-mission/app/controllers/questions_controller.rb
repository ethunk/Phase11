
class QuestionsController < ApplicationController

  def index
    @questions = Question.order(:created_at)
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Question posted sucessfully"
      redirect_to question_path(@question)
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)

    if @question.save
      flash[:notice] = "Question saved"
      redirect_to question_path(@question)
    else
      render "edit"
    end
  end

  def destroy
    Question.destroy(params[:id])
    redirect_to questions_path
  end

  private

  # Rails won't automatically trust params from the interwebs.
  def question_params
    params.require(:question).permit(:title, :description)
  end


end
