class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates_presence_of :user, :category, :description

  def mark_completed
  	self.completed = true
  	save
  end
end
