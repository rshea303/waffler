class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    project = Project.find_by(id: params[:project_id])
    if @item.save
      project.items << @item
      redirect_to project_path(project)
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description)
  end
end
