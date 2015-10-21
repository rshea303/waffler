class ProjectPresenter
  attr_reader :project

  def initialize(project)
    @project = project
  end

  def name
    project.name
  end

  def backlogs
    project.backlogged_items
  end

  def ready
    project.ready_items
  end

  def in_progress
    project.in_progress_items
  end

  def done
    project.done_items
  end
end
