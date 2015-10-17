class Project < ActiveRecord::Base
  has_many :items

  def backlogged_items
    items.where(category_id: 1)
  end

  def ready_items
    items.where(category_id: 2)
  end
end
