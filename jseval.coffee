if Meteor.isClient
  Template.code.events =
    'keyup textarea': (e) ->
      Session.set 'input', $(e.target).val()

  Template.code.rendered = ->
    prettyPrint()

  Template.code.input = ->
    Session.get 'input'

  Template.code.output = ->
    try
      eval Session.get 'input'
    catch e
      e