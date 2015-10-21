class Project < ActiveRecord::Base
  has_many :items

  def backlogged_items
    items.where(category_id: 1)
  end

  def ready_items
    items.where(category_id: 2)
  end

  def in_progress_items
    items.where(category_id: 3)
  end

  def done_items
    items.where(category_id: 4)
  end
end
