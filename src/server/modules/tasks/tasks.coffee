Meteor.startup ->
  Tasks.allow
    insert: (userId, task)-> userId?
    update: (userId, task)-> if task.user is userId then true else false
    remove: (userId, task)-> if task.user is userId then true else false

Meteor.publish 'tasks-day', (date)->
  start = new Date(date)
  end = new Date(date)

  start.setDate(end.getDate() - 1)
  end.setDate(end.getDate() + 1)

  start.setHours 23,59,59,999
  end.setHours 0,0,1,0
  Tasks.find { user: this.userId, date: { $gte: start, $lt: end } }
