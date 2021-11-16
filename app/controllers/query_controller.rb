class QueryController < ApplicationController
  def index
    @querys = Query.all
  end

  def new
    @query = Query.new
  end

  def create
    @query = Query.new(query_params)
    if @query.save
      redirect_to query_index_path
    else
      render :new
    end
  end

  def destroy
    Query.find(params[:id]).destroy
    redirect_to query_index_path, notice: "Question deleted."
  end

  private

  def query_params
    params.require(:query).permit(:question )
  end

end
