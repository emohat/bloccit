class SummariesController < ApplicationController

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @summary = Summary.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @summary = Summary.new(params.require(:summary).permit(:description))
    @summary.post = @post
    if @summary.save!
      flash[:notice] = "Your summary was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving your post's summary."
      render :new
    end
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @post = @topic.post.find(params[:id])
    @summary = @post.summary
  end
end
