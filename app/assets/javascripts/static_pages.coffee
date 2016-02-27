$(document).ready ->
  $('#users-content')[0].style.display = 'none'

  $('.btn-sidebar').click ->
    $('body').toggleClass 'showSidebar'
    $('#sidebar').css({'z-index':'1000'})
    return

  hideSidebar = ->
    $('body').toggleClass 'showSidebar'
    $('#sidebar').css({'z-index':'-2'})

  clickLink = (type) ->
    $.ajax
      url: '/users',
      type: 'GET',
      dataType: 'JSON',
      async: false,
      data: { users: type }
      success: (response) ->
        return response
      error: ->
        alert 'something went wrong'
        return []

  editUserTitle = (title) ->
    $("#users-title").empty()
    $("#users-title").append(title + " users")

  buildUserTable = (users) ->
    $('#users-list').empty()
    users = JSON.parse(users)
    users.forEach (u) ->
      $('#users-list').append("<li>" + u.email + "</li>")

  $('#home-page').click (e) ->
    $('#users-content')[0].style.display = 'none'
    $('#home-content')[0].style.display = ''
    hideSidebar()
    e.preventDefault()

  $('#admin-users').click (e) ->
    $('#home-content')[0].style.display = 'none'
    $('#users-content')[0].style.display = ''
    editUserTitle('Admin')
    response = clickLink('admin')
    users = response.responseText
    buildUserTable(users)
    hideSidebar()
    e.preventDefault()
    return

  $('#inactive-users').click (e) ->
    $('#home-content')[0].style.display = 'none'
    $('#users-content')[0].style.display = ''
    editUserTitle('Inactive')
    response = clickLink('all')
    users = response.responseText
    buildUserTable(users)
    hideSidebar()
    e.preventDefault()
    return

  $('#all-users').click (e) ->
    $('#home-content')[0].style.display = 'none'
    $('#users-content')[0].style.display = ''
    editUserTitle('All')
    response = clickLink('all')
    users = response.responseText
    buildUserTable(users)
    hideSidebar()
    e.preventDefault()
    return

  $('#sample-users').click (e) ->
    $('#home-content')[0].style.display = 'none'
    $('#users-content')[0].style.display = ''
    editUserTitle('Sample')
    response = clickLink('sample')
    users = response.responseText
    buildUserTable(users)
    hideSidebar()
    e.preventDefault()
    return

