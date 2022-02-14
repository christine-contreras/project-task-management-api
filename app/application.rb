class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    # projects get/read 
  if req.path.match(/projects/) && req.get? #controller interprates the request given from the front-end

    #check if requesting all projects or an individual project
    if req.path.split("/projects/").length === 1 
      # retrieve information from model and send back information to the front-end
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "projects successfully requested", :projects => Project.all}.to_json(:include => :tasks) ]]
    else 
      project = Project.find_by_path(req.path, "/projects/")
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "project successfully requested", :project => project}.to_json(:include => { :boards => {:include => :tasks}}) ]]
    end #check if all projects or specific project
    


    # projects post/create (tested)
    elsif req.path.match(/projects/) && req.post?
      hash = JSON.parse(req.body.read)
      project = Project.create_new_project_with_defaults(hash)

      if project.save
        return [200, { 'Content-Type' => 'application/json' }, [ {:message => "project successfully created", :project => project}.to_json(:include => :tasks) ]]
      else
        return [422, { 'Content-Type' => 'application/json' }, [ {:error => "project not added"}.to_json ]]
      end #end validation of post

    # projects patch/update (tested)
    elsif req.path.match(/projects/) && req.patch?
      project = Project.find_by_path(req.path, "/projects/")

      if project
        data = JSON.parse(req.body.read)
        if project.update(data)
          return [200, {"Content-Type" => "application/json"}, [{message: "project successfully updated", project: project}.to_json]]
        else
          return [422, {"Content-Type" => "application/json"}, [{error: "project not updated. Invalid data."}.to_json]]
        end
        #if: project was updated
      else
        return [404, {"Content-Type" => "application/json"}, [{error: "project not found."}.to_json]]
      end #if : project exists

    # project delete
    elsif req.path.match(/projects/) && req.delete?
      project = Project.find_by_path(req.path, "/projects/")

      if project && project.destroy
        return [200, {"Content-Type" => "application/json"}, [{message: "project successfully deleted", project: project}.to_json]]
      else
        return [404, {"Content-Type" => "application/json"}, [{error: "project not found."}.to_json]]
      end #if : project exists

    # boards get/read (tested)
    elsif req.path.match(/boards/) && req.get?
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "boards successfully requested", :boards => Board.render_all_formatted_for_frontend}.to_json ]]


    # boards post/create (tested)
    elsif req.path.match(/boards/) && req.post? 
      # parse JSON into a readable format for my back-end
      hash = JSON.parse(req.body.read)
      # check if the project ID passed in exists
      project = Project.find_by_id(hash["project_id"])

      # if project id was valid move on to creating the new board
      if project 
        board = Board.new(name: hash["name"], project_id: hash["project_id"])
        if board.save
          return [200, { 'Content-Type' => 'application/json' }, [ {:message => "board successfully created", :board => board}.to_json ]]
        else
          return [422, { 'Content-Type' => 'application/json' }, [ {:error => "board not added. Invalid Data"}.to_json ]]
        end #end validation of post
      else
        return [422, { 'Content-Type' => 'application/json' }, [ {:error => "board not added. Invalid Project Id."}.to_json ]]
      end #if: check if project exists
      
    # boards patch/update (tested)
    elsif req.path.match(/boards/) && req.patch?
      board = Board.find_by_path(req.path, "/boards/")

      if board 
        data = JSON.parse(req.body.read)

        if board.update(data)
         return [200, {"Content-Type" => "application/json"}, [{message: "board successfully updated", board: board}.to_json]]
        else
          return [422, {"Content-Type" => "application/json"}, [{error: "board not updated. Invalid data."}.to_json]]
        end # if: update was successful

      else
        return [404, {"Content-Type" => "application/json"}, [{error: "board not found."}.to_json]]
      end #if : board exists

    # boards delete (tested)
    elsif req.path.match(/boards/) && req.delete?
      board = Board.find_by_path(req.path, "/boards/")

      if board && board.destroy
        return [200, {"Content-Type" => "application/json"}, [{message: "board successfully deleted", board: board}.to_json]]
      else
        return [404, {"Content-Type" => "application/json"}, [{error: "board not found."}.to_json]]
      end #if : board exists & destroyed


    # tasks get/read (tested)
    elsif req.path.match(/tasks/) && req.get?
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "tasks successfully requested", :tasks => Task.render_all_formatted_for_frontend}.to_json ]]

    # tasks post/create (tested)
    elsif req.path.match(/tasks/) && req.post?
      hash = JSON.parse(req.body.read)
      board = Board.find_by_id(hash["board_id"])

      if board 
        task = Task.create_new_task_with_defaults(hash) #custom method

        if task.save
          return [200, { 'Content-Type' => 'application/json' }, [ {:message => "task successfully created", :task => task}.to_json ]]
        else
          return [422, { 'Content-Type' => 'application/json' }, [ {:error => "task not added. Invalid Data"}.to_json ]]
        end #end validation of post
      else
        return [422, { 'Content-Type' => 'application/json' }, [ {:error => "task not added. Invalid Board Id."}.to_json ]]
      end #if: check if board  exists

     # tasks patch/update (tested)
    elsif req.path.match(/tasks/) && req.patch?
      task = Task.find_by_path(req.path, "/tasks/")

      if task 
        data = JSON.parse(req.body.read)

        if task.update(data)
        return [200, {"Content-Type" => "application/json"}, [{message: "task successfully updated", task: task}.to_json]]
        else
          return [422, {"Content-Type" => "application/json"}, [{error: "task not updated. Invalid data."}.to_json]]
        end # if: update was successful

      else
        return [404, {"Content-Type" => "application/json"}, [{error: "task not found."}.to_json]]
      end #if : task exists

    # tasks delete (tested)
    elsif req.path.match(/tasks/) && req.delete?
      task = Task.find_by_path(req.path, "/tasks/")

      if task && task.destroy
        return [200, {"Content-Type" => "application/json"}, [{message: "task successfully deleted", task: task}.to_json]]
      else
        return [404, {"Content-Type" => "application/json"}, [{error: "task not found."}.to_json]]
      end #if : task exists & destroyed

      

    else
      resp.write "Path Not Found"

    end

    resp.finish
  end

end

# GET /projects - get all project
# PUT /projects - create new project
# PATCH /project/:id - update project name
# DELETE /project/:id - delete project (maybe also delete all boards and tasks associated)

# GET /boards - get all boards associated to project
# PUT /boards - create new board within project
# PATCH /boards/:id - update board name
# DELETE /boards/:id - delete board (maybe also delete all tasks associated)

# GET /tasks - get all tasks associated with board
# PUT /tasks - create new task within board
# PATCH /tasks/:id - update task
# DELETE /tasks/:id - delete task






