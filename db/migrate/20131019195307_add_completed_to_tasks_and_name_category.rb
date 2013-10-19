class AddCompletedToTasksAndNameCategory < ActiveRecord::Migration
  def change
  	change_table :tasks do |t|
  	  t.boolean :completed, :default => false, :null => false
  	end
  	change_table :categories do |t|
  	  t.string :name
  	end
  end
end
