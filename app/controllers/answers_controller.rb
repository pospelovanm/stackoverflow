class AnswersController < ApplicationController

  def rating
    @answerId = params[:answerId]
    @rating = params[:rating]
    @answer = Answer.find(params[:answerId])
    @answer.ratingAnswer = @rating
    @answer.save

    render :nothing => true

  end


  def create
    if user_signed_in?
      @question = Question.find(params[:question_id])
      @user = User.find(current_user)
      @answer = @question.answers.new(answer_params)
      @answer.user_id = @user.id
      @answer.save
      respond_to do |format|
          format.html { redirect_to @question }
          format.js

      end
    else
      # redirect_to user_session_path
      render :js => "window.location = '/users/sign_in'"
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:answer_id])
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])

    if @answer.update(answer_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @answer = @question.answers.find(params[:answer_id])
    @answer.destroy
    redirect_to @question, :notice => "The answer has been deleted"
  end

  private
  def answer_params
    params.require(:answer).permit(:contentAnswer)
  end

end


