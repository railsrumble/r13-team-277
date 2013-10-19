class RenameTypeToTaskType < ActiveRecord::Migration
  def change
  	change_table :tasks do |t|
  	  t.remove :type
  	  t.column :task_type, :string
  	end
  end
end
