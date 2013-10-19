class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.string :type
      t.integer :priority
      t.time :time

      t.timestamps
    end
  end
end
