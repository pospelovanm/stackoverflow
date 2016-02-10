class QuestionsController < ApplicationController

  def rating
     @questionId = params[:questionId]
     @rating = params[:rating]
     @question = Question.find(params[:questionId])
     @question.ratingQuestion = @rating
     @question.save

     render :nothing => true

  end

  def index
    @questions = Question.all

  end

  def new
    if user_signed_in?
    @question = Question.new
    end
  end

  def create
    @user = User.find(current_user)
    @question = Question.new(question_params)
    @question.user_id = @user.id

    respond_to do |format|
      if @question.save
          format.html { redirect_to questions_path, notice: 'Question was successfully created.' }
          format.json { render :show, status: :created, location: @question }
        else
          format.html { render :new }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      end
  end

  def show
    @question = Question.find(params[:id])
    @user = User.find(@question.user_id)
    @answers = @question.answers
  end

  def edit
    @question = Question.find(params[:id])
  end


def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to @question, :notice => "The question has been deleted"
  end

  private

  def question_params
    params.require(:question).permit(:title, :contentQuestion, :ratingQuestion)
  end

end
