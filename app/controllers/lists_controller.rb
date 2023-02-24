class ListsController < ApplicationController
  def index
    @list = List.all
  end

  def show
    @list = List.find(params[:id])
    @names = List.all.first(3).map(&:name)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_parameters)
    if @list.save
      redirect_to @list
    else
      render :new
    end
  end

  private
  def list_parameters
    params.require(:list).permit(
      :name,
      :photo
    )
  end
end
