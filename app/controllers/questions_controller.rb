class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

    def create
      @question = Question.new(params.require(:question).permit(:title,:body))
      if @question.save
        flash[:notice] = "Question was saved."
        redirect_to @question
      else 
        flash[:error] = "Something went wrong with saving."
        render :new
     end
   end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end
    def update
      @question = Question.find(params[:id])
    if @question.update_attributes(params.require(:question).permit(:title, :body, :resolved
      ))
      flash[:notice] = "Question was updated."
      redirect_to @question
    else
      flash[:error] = "Sorry, we couldn't update your question.  Please try again."
      render :update
    end
end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Your question was deleted."
    redirect_to questions_path
  end
end
