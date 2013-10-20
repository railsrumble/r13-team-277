class Task < ActiveRecord::Base
  include TaskType
  belongs_to :user
  belongs_to :category
  serialize :task_type

  validates_presence_of :user, :description

  def mark_completed
  	self.completed = true
  	save
  end
  
  def category_name
    if self.category
      return self.category.name
    else
      return ""
    end
  end
end
