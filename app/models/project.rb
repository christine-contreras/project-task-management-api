class Project < ActiveRecord::Base
    has_many :boards, dependent: :destroy
    has_many :tasks, through: :boards


    def self.find_by_path(path)
        project_id = path.split("/projects/").last.to_i 
        self.find_by_id(project_id)

    end

end