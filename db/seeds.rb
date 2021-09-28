puts "Clearing old data..."
Task.destroy_all
Board.destroy_all
UserProject.destroy_all
Project.destroy_all
User.destroy_all

puts "Seeding users..."
christine = User.create(
    first_name: 'Christine',
    last_name: 'Contreras',
    email: 'christineec23@yahoo.com',
    password: 'password',
    logged_in: false
)

test = User.create(
    first_name: 'Test',
    last_name: 'Name',
    email: 'test@yahoo.com',
    password: 'testing',
    logged_in: false
)

puts "Seeding projects..."
drapers = Project.create(
    title: 'Drapers',
    favorite: false,
    color: '#e1bee7'
)

haband = Project.create(
    title: 'Haband',
    favorite: true,
    color: '#e1bee7'
)

apple = Project.create(
    title: 'Appleseeds',
    favorite: false,
    color: '#e1bee7'
)

blair = Project.create(
    title: 'Blair',
    favorite: false,
    color: '#e1bee7'
)

puts "Seeding join table for users and projects..."
UserProject.create(user_id: christine.id, project_id: drapers.id)
UserProject.create(user_id: christine.id, project_id: haband.id)
UserProject.create(user_id: christine.id, project_id: apple.id)
UserProject.create(user_id: christine.id, project_id: blair.id)


puts "Seeding boards..."
drapers_backlog = drapers.boards.build(name: 'Backlog')
drapers_todo = drapers.boards.build(name: 'To Do')
drapers_completed = drapers.boards.build(name: 'Completed')
drapers.save


apple_backlog = apple.boards.build(name: 'Backlog')
apple_todo = apple.boards.build(name: 'To Do')
apple_completed = apple.boards.build(name: 'Completed')
apple.save

blair_backlog = blair.boards.build(name: 'Backlog')
blair_todo = blair.boards.build(name: 'To Do')
blair_completed = blair.boards.build(name: 'Completed')
blair.save


puts "Seeding tasks..."
blair_todo.tasks.build(
    name: 'Homepage WK40',
    due_date: Date.new(2021,10,1),
    description: '',
    status: 'Not Started',
    priority: 'Medium',
    completed: false
)

blair_todo.tasks.build(
    name: 'Flyout Images',
    due_date: Date.new(2021,10,1),
    description: '',
    status: 'Not Started',
    priority: 'Low',
    completed: false
)


blair_todo.tasks.build(
    name: 'Banner - B3JBQ - Free Shipping on 59',
    due_date: Date.new(2021,10,1),
    description: 'Global Banner - B3JBQ - Free Shipping on 59\nGlobal Disclaimer -  B3JBQ - Free Shipping on 59\nCheckout Banner - B3JBQ - Free Shipping on 59',
    status: 'Not Started',
    priority: 'High',
    completed: false
)

blair_todo.save


blair_completed.tasks.build(
    name: 'Homepage Clickmap Changes',
    due_date: Date.new(2021,9,29),
    description: '',
    status: 'Complete',
    priority: 'Medium',
    completed: true
)

blair_completed.save



apple_todo.tasks.build(
    name: 'Homepage Fall 3 WK40',
    due_date: Date.new(2021,10,1),
    description: '',
    status: 'Not Started',
    priority: 'High',
    completed: false
)

apple_todo.tasks.build(
    name: 'Banner - A21M3 - Up To 25 Off Sweaters Pants FSH 79',
    due_date: Date.new(2021,10,4),
    description: 'Global Banner - A21M3 - Up To 25 Off Sweaters Pants FSH 79\nGlobal Disclaimer - A21M3 - Up To 25 Off Sweaters Pants FSH 79\nClothing - Flyout Offer - A21M3 - Up To 25 Off Sweaters Pants FSH 79\nTops - Flyout Offer - A21M3 - Up To 25 Off Sweaters Pants FSH 79\nCoupons - A21M3 - Up To 25 Off Sweaters Pants FSH 79\nDaily Offers - A21M3 - Up To 25 Off Sweaters Pants FSH 79\nHomePage - Banner - A21M3 - Up To 25 Off Sweaters Pants FSH 79',
    status: 'Not Started',
    priority: 'Medium',
    completed: false
)

apple_todo.tasks.build(
    name: 'Banner - APPLE - 30 Off FSH 79',
    due_date: Date.new(2021,10,7),
    description: 'Global Banner - APPLE - 30 Off FSH 79\nGlobal Disclaimer - APPLE - 30 Off FSH 79\nClothing - Flyout Offer - APPLE - 30 Off FSH 79\nTops - Flyout Offer - APPLE - 30 Off FSH 79\nCoupons - APPLE - 30 Off FSH 79\nDaily Offers - APPLE - 30 Off FSH 79\nHomePage - Banner - APPLE - 30 Off FSH 79',
    status: 'Not Started',
    priority: 'High',
    completed: false
)

apple_todo.save


drapers_todo.tasks.build(
    name: 'Banner - Banner - DD994 - 25 Dollars Off 100 FSH 100',
    due_date: Date.new(2021,9,29),
    description: 'promo code only\nBanner - Banner - DD994 - 25 Dollars Off 100 FSH 100\nGlobal Disclaimer - Banner - DD994 - 25 Dollars Off 100 FSH 100\nHomepage - Banner - DD994 - 25 Dollars Off 100 FSH 100',
    status: 'Complete',
    priority: 'High',
    completed: true
)

drapers_todo.tasks.build(
    name: 'Banner - DND139 - 25 Off 100 FSH 100',
    due_date: Date.new(2021,9,29),
    description: 'promo code only\nGlobal Banner - Banner - DND139 - 25 Off 100 FSH 100\nGlobal Disclaimer - Banner - DND139 - 25 Off 100 FSH 100\nHomepage - Banner - DND139 - 25 Off 100 FSH 100',
    status: 'In Progress',
    priority: 'High',
    completed: false
)

drapers_todo.tasks.build(
    name: 'Promo Code TEST',
    due_date: Date.new(2021,9,30),
    description: 'Global Banner - Banner - TEST - In Monetate\nGlobal Disclaimer - Banner - DND142 - 25 Dollars Off 100 FSH 100\nGlobal Disclaimer - Banner - DND141 - 25 Off 100 FSH 100\nGlobal Banner - Banner - TEST - In Monetate',
    status: 'In Progress',
    priority: 'High',
    completed: false
)

drapers_todo.tasks.build(
    name: 'Workspace for Test',
    due_date: Date.new(2021,9,30),
    description: '',
    status: 'Not Started',
    priority: 'Low',
    completed: false
)

drapers_todo.save


puts "Done Seeding!"