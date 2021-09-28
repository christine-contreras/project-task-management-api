class CreateJoinerTableUserprojects < ActiveRecord::Migration[5.2]
  def change
    create_table :userprojects do |t|
      t.timestamps
      t.belongs_to :project 
      t.belongs_to :user
    end
  end
end
