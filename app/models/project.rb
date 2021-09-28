require_relative './models_module'

class Project < ActiveRecord::Base
    extend InheritMethods::ClassMethods #extend is for class methods
    has_many :boards, dependent: :destroy
    has_many :tasks, through: :boards


    def self.create_new_project_with_defaults(hash)
        title = hash["title"] ? hash["title"] : "New Project"
        favorite = hash["favorite"] ? hash["title"] : false
        color = hash["color"] ? hash["color"] : '#e1bee7'
        self.new(
            title: title,
            favorite: favorite,
            color: color
        )
    end


    # # def self.find_by_path(path)
    #     project_id = path.split("/projects/").last.to_i 
    # #     self.find_by_id(project_id)

    # # end

end