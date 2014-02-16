this.Tasks = new Meteor.Collection2 'tasks',
  schema:
    title:
      type: String
      label: "Title"
    user:
      type: String
      label: "User ID"
    date:
      type: Date
      label: "Date"
    delta:
      type: Number
      label: "Delta"
      optional: true,
    completed:
      type: Boolean
      label: "Completed"
  transform: (task)->
    if Meteor.isClient
      task.dateFormatted = moment(task.date).format('MMMM DD, YYYY')
      task.userObject = Meteor.users.findOne { _id: task.user }
    return task
