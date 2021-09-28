class RenameUserprojectsTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :userprojects, :user_projects
  end
end
