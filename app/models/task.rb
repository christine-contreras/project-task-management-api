class Task < ActiveRecord::Base
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
            archived: task.archived,
            board: task.board.name,
            board_id: task.board_id,
            created_at: task.created_at,
            updated_at: task.updated_at
            }
        end

    end

end