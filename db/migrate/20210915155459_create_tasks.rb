class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name 
      t.date :due_date
      t.text :description
      t.string :status
      t.string :priority
      t.boolean :completed
      t.belongs_to :board
      t.timestamps
    end
  end
end
