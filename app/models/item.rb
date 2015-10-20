class Item < ActiveRecord::Base
  belongs_to :category
  belongs_to :project

  def move_forward
    self.category_id += 1
    self.save
  end

  def move_backward
    self.category_id -=1
    self.save
  end
end
