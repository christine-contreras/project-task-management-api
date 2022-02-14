puts "Clearing old data..."
Task.destroy_all
Board.destroy_all

Project.destroy_all

puts "Seeding projects..."
client1 = Project.create(
    title: 'Client 1',
    favorite: false,
    color: '#e1bee7'
)

client2 = Project.create(
    title: 'Client 2',
    favorite: true,
    color: '#e1bee7'
)

client3 = Project.create(
    title: 'Client 3',
    favorite: false,
    color: '#e1bee7'
)

client4 = Project.create(
    title: 'Client 4',
    favorite: false,
    color: '#e1bee7'
)


puts "Seeding boards..."
client1_backlog = client1.boards.build(name: 'Backlog')
client1_todo = client1.boards.build(name: 'To Do')
client1_completed = client1.boards.build(name: 'Completed')
client1.save


apple_backlog = client2.boards.build(name: 'Backlog')
apple_todo = client2.boards.build(name: 'To Do')
apple_completed = client2.boards.build(name: 'Completed')
client2.save

client3_backlog = client3.boards.build(name: 'Backlog')
client3_todo = client3.boards.build(name: 'To Do')
client3_completed = client3.boards.build(name: 'Completed')
client3.save


puts "Seeding tasks..."
client3_todo.tasks.build(
    name: 'Homepage WK40',
    due_date: Date.new(2021,10,1),
    description: '',
    status: 'Not Started',
    priority: 'Medium',
    completed: false
)

client3_todo.tasks.build(
    name: 'Flyout Images',
    due_date: Date.new(2021,10,1),
    description: '',
    status: 'Not Started',
    priority: 'Low',
    completed: false
)


client3_todo.tasks.build(
    name: 'Banner - B3JBQ - Free Shipping on 59',
    due_date: Date.new(2021,10,1),
    description: 'Global Banner - B3JBQ - Free Shipping on 59\nGlobal Disclaimer -  B3JBQ - Free Shipping on 59\nCheckout Banner - B3JBQ - Free Shipping on 59',
    status: 'Not Started',
    priority: 'High',
    completed: false
)

client3_todo.save


client3_completed.tasks.build(
    name: 'Homepage Clickmap Changes',
    due_date: Date.new(2021,9,29),
    description: '',
    status: 'Complete',
    priority: 'Medium',
    completed: true
)

client3_completed.save



client4_todo.tasks.build(
    name: 'Homepage Fall 3 WK40',
    due_date: Date.new(2021,10,1),
    description: '',
    status: 'Not Started',
    priority: 'High',
    completed: false
)

client4_todo.tasks.build(
    name: 'Banner - A21M3 - Up To 25 Off Sweaters Pants FSH 79',
    due_date: Date.new(2021,10,4),
    description: 'Global Banner - A21M3 - Up To 25 Off Sweaters Pants FSH 79\nGlobal Disclaimer - A21M3 - Up To 25 Off Sweaters Pants FSH 79\nClothing - Flyout Offer - A21M3 - Up To 25 Off Sweaters Pants FSH 79\nTops - Flyout Offer - A21M3 - Up To 25 Off Sweaters Pants FSH 79\nCoupons - A21M3 - Up To 25 Off Sweaters Pants FSH 79\nDaily Offers - A21M3 - Up To 25 Off Sweaters Pants FSH 79\nHomePage - Banner - A21M3 - Up To 25 Off Sweaters Pants FSH 79',
    status: 'Not Started',
    priority: 'Medium',
    completed: false
)

client4_todo.tasks.build(
    name: 'Banner - APPLE - 30 Off FSH 79',
    due_date: Date.new(2021,10,7),
    description: 'Global Banner - APPLE - 30 Off FSH 79\nGlobal Disclaimer - APPLE - 30 Off FSH 79\nClothing - Flyout Offer - APPLE - 30 Off FSH 79\nTops - Flyout Offer - APPLE - 30 Off FSH 79\nCoupons - APPLE - 30 Off FSH 79\nDaily Offers - APPLE - 30 Off FSH 79\nHomePage - Banner - APPLE - 30 Off FSH 79',
    status: 'Not Started',
    priority: 'High',
    completed: false
)

client4_todo.save


client1_todo.tasks.build(
    name: 'Banner - Banner - DD994 - 25 Dollars Off 100 FSH 100',
    due_date: Date.new(2021,9,29),
    description: 'promo code only\nBanner - Banner - DD994 - 25 Dollars Off 100 FSH 100\nGlobal Disclaimer - Banner - DD994 - 25 Dollars Off 100 FSH 100\nHomepage - Banner - DD994 - 25 Dollars Off 100 FSH 100',
    status: 'Complete',
    priority: 'High',
    completed: true
)

client1_todo.tasks.build(
    name: 'Banner - DND139 - 25 Off 100 FSH 100',
    due_date: Date.new(2021,9,29),
    description: 'promo code only\nGlobal Banner - Banner - DND139 - 25 Off 100 FSH 100\nGlobal Disclaimer - Banner - DND139 - 25 Off 100 FSH 100\nHomepage - Banner - DND139 - 25 Off 100 FSH 100',
    status: 'In Progress',
    priority: 'High',
    completed: false
)

client1_todo.tasks.build(
    name: 'Promo Code TEST',
    due_date: Date.new(2021,9,30),
    description: 'Global Banner - Banner - TEST - In Monetate\nGlobal Disclaimer - Banner - DND142 - 25 Dollars Off 100 FSH 100\nGlobal Disclaimer - Banner - DND141 - 25 Off 100 FSH 100\nGlobal Banner - Banner - TEST - In Monetate',
    status: 'In Progress',
    priority: 'High',
    completed: false
)

client1_todo.tasks.build(
    name: 'Workspace for Test',
    due_date: Date.new(2021,9,30),
    description: '',
    status: 'Not Started',
    priority: 'Low',
    completed: false
)

client1_todo.save


puts "Done Seeding!"