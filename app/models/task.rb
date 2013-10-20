class Task < ActiveRecord::Base
  include TaskType
  belongs_to :user
  belongs_to :category

  validates_presence_of :user, :description

  def mark_completed
  	self.completed = true
  	save
  end
end
