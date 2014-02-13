Meteor.startup ->
  Tasks.allow
    insert: (userId, order)-> true
    update: (userId, order)-> true
    remove: (userId, order)-> true

Meteor.publish 'tasks-all', -> Tasks.find()
