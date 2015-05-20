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
    if @question.update_attributes(params.require(:question).permit(:title, :body))
      flash[:notice] = "Question was updated."
      redirect_to @question
    else
      flash[:error] = "Sorry, we couldn't update your question.  Please try again."
      render :editupdate
    end
  end


  def destroy
  end
end
