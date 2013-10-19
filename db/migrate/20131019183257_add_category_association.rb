class AddCategoryAssociation < ActiveRecord::Migration
  def change
  	create_table :categories do |t|
      t.integer :user_id
      t.integer :task_id
      t.belongs_to :user

      t.timestamps
    end
    change_table :tasks do |t|
  	  t.belongs_to :category
  	end
  end
end
