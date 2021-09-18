class AddFavoriteToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :favorite, :boolean
  end
end
