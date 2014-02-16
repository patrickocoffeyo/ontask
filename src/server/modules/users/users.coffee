Meteor.methods
  'cancelAccount': ->
    Meteor.users.remove { _id: Meteor.userId() }
