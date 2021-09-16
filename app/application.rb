class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    # projects get
    if req.path.match(/projects/) && req.get?
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "projects successfully requested", :projects => Project.all}.to_json ]]

    # projects post
    elsif req.path.match(/projects/) && req.post?
      hash = JSON.parse(req.body.read)
      project = Project.new(hash)

      if project.save
        return [200, { 'Content-Type' => 'application/json' }, [ {:message => "project successfully created", :project => project}.to_json ]]
      else
        return [422, { 'Content-Type' => 'application/json' }, [ {:error => "project not added"}.to_json ]]
      end #end validation of post

    # projects patch
    elsif req.path.match(/projects/) && req.patch?
      project = Project.find_by_path(req.path)

      if project
        data = JSON.parse(req.body.read)
        if project.update(data)
          return [200, {"Content-Type" => "application/json"}, [{message: "project successfully updated", project: project}.to_json]]
        else
          return [422, {"Content-Type" => "application/json"}, [{message: "project not updated. Invalid data."}.to_json]]
        end
        #if: project was updated
      else
        return [404, {"Content-Type" => "application/json"}, [{message: "project not found."}.to_json]]
      end #if : project exists

    # project delete
    elsif req.path.match(/projects/) && req.delete?
      project = Project.find_by_path(req.path)

      if project && project.destroy
        return [200, {"Content-Type" => "application/json"}, [{message: "project successfully deleted", project: project}.to_json]]
      else
        return [404, {"Content-Type" => "application/json"}, [{message: "project not found."}.to_json]]
      end #if : project exists

    # tasks get
    elsif req.path.match(/tasks/) && req.get?
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "tasks successfully requested", :tasks => Task.render_all}.to_json ]]
    else
      resp.write "Path Not Found"

    end

    resp.finish
  end

end

# GET /tasks - get all tasks associated with board
# PUT /tasks - create new task within board
# PATCH /tasks/:id - update task
# DELETE /tasks/:id - delete task

# GET /boards - get all boards associated to project
# PUT /boards - create new board within project
# PATCH /boards/:id - update board name
# DELETE /boards/:id - delete board (maybe also delete all tasks associated)


# GET /projects - get all project
# PUT /projects - create new project
# PATCH /project/:id - update project name
# DELETE /project/:id - delete project (maybe also delete all boards and tasks associated)

