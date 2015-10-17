class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find_by(id: params[:id])
    # @items = @project.items
    @backlogs = @project.backlogged_items
    @ready = @project.ready_items
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end
end
