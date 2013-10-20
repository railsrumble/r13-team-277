class AddWeightToTasks < ActiveRecord::Migration
  def change
  	change_table :tasks do |t|
  		t.integer :weight
  	end
  end
end
