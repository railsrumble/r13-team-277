class AddUserTaskAssociation < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.belongs_to :user
      t.change :time, :datetime
    end
  end
end
