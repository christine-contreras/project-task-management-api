puts "Clearing old data..."
Task.destroy_all
Board.destroy_all
Project.destroy_all

puts "Seeding projects..."
creative = Project.create(
    title: 'Creative'
)

web = Project.create(
    title: 'Web'
)

email = Project.create(
    title: 'Email'
)

puts "Seeding boards..."
creative_backlog = creative.boards.build(name: 'Backlog')
creative_todo = creative.boards.build(name: 'To Do')
creative_done = creative.boards.build(name: 'Done')
creative.save


web_backlog = web.boards.build(name: 'Backlog')
web_todo = web.boards.build(name: 'To Do')
web_done = web.boards.build(name: 'Done')
web.save

puts "Seeding tasks..."
creative_backlog.tasks.build(
    name: 'Wk 37 Homepage',
    due_date: Date.new(2021,9,21),
    description: 'Send over homepage for approval',
    status: 'Not Started',
    priority: 'High',
    archived: false
)
creative_backlog.save

web_done.tasks.build(
    name: 'Wk 37 Banners',
    due_date: Date.new(2021,9,14),
    description: 'banners for promo need to go on the homepage and checkout',
    status: 'Approved',
    priority: 'Medium',
    archived: false
)
web_done.save


puts "Done Seeding!"