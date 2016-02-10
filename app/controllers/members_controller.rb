class MembersController < ApplicationController

  def profile
    @user = User.find(params[:id])
    respond_to do |format|
      format.js
      format.html {render "profile"}
    end
  end

  def activities
    respond_to do |format|
      format.js
      format.html {render "activities"}
    end
  end

  def display_questions
    @user = User.find(params[:user_id])
    @displayQuestions = Question.where("user_id = ?", params[:user_id])
    respond_to do |format|
      format.js
      format.html {render "display_questions" }
    end
  end

  def display_answers
    @user = User.find(params[:user_id])
    @displayAnswers = Answer.where("user_id = ?", params[:user_id])
    respond_to do |format|
      format.js
      format.html {render "display_answers" }
    end
  end

end
