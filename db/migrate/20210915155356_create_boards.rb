class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :name
      t.timestamps
      t.belongs_to :project
    end
  end
end
