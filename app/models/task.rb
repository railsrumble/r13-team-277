class Task < ActiveRecord::Base
  include ActionView::Helpers::TextHelper
  include TaskType
  
  belongs_to :user
  belongs_to :category
  serialize :task_type

  validates_presence_of :user, :description
  
  before_save :truncate_description

  def mark_completed
  	self.completed = true
  	save
  end
  
  def truncate_description
    self.description = truncate(self.description, :length => 60)
  end
  
  def category_name
    if self.category
      return self.category.name
    else
      return ""
    end
  end
end
