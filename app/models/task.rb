require_relative './models_module'

class Task < ActiveRecord::Base
    extend InheritMethods::ClassMethods #extend is for class methods

    belongs_to :board
    has_one :project, through: :board

    def self.render_all_formatted_for_frontend
        self.all.map do |task|
            {
            id: task.id,
            name: task.name,
            due_date: task.due_date,
            description: task.description,
            status: task.status,
            priority: task.priority,
            completed: task.completed,
            board: task.board.name,
            board_id: task.board_id,
            project: task.board.project.title,
            project_id: task.board.project_id,
            created_at: task.created_at,
            updated_at: task.updated_at
            }
        end
    end

    def self.create_new_task_with_defaults(hash)
        name = hash["name"] ? hash["name"] : "New Task"
        status = hash["status"] ? hash["status"] : "Not Started"
        priority = hash["priority"] ? hash["priority"] : "Low"
        completed = hash["completed"] ? hash["completed"] : false
        self.new(
            name: name,
            due_date: hash["due_date"],
            description: hash["description"],
            status: status,
            priority: priority,
            completed: completed,
            board_id: hash["board_id"]
        )
    end
end