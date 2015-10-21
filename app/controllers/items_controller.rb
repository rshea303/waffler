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

  def update
    item = Item.find(params[:id])
    project = Project.find(params[:project_id])

    if params[:format] == '->'
      item.move_forward  
    elsif params[:format] == '<-'
      item.move_backward
    else
      # update the item details
    end
    redirect_to project_path(project)
  end

  private

  def item_params
    params.require(:item).permit(:title, :description)
  end
end
