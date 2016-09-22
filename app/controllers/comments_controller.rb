class CommentsController < ApplicationController
  def create
    @comment = Comment.new find_params
    @report = Report.find params[:report_id]
    @comment.report = @report
    # respond_to do |format|
        if @comment.save
            flash[:notice] = 'successfully Added'
             redirect_to report_path(@report)
            # format.js { render :create_success}
        else
            flash[:notice] = 'Fixed the errors'
          render '/reports/show'
            # format.js { render :create_failure }
        end

  end
  def update


  end
private
  def find_params
    params.require(:comment).permit(:name, :body)
  end

end
