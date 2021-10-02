require_relative './models_module'

class Board < ActiveRecord::Base
    extend InheritMethods::ClassMethods #extend is for class methods
    
    belongs_to :project 
    has_many :tasks, dependent: :destroy

    def self.render_all_formatted_for_frontend
        self.all.map do |board|
            {
            id: board.id,
            name: board.name,
            project: board.project.title,
            project_id: board.project_id,
            created_at: board.created_at,
            updated_at: board.updated_at
            }
        end
    end

end