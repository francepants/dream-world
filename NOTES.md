# Dream World #
- What it is:
    - a user can log their dreams in this online journal
- 1. user can sign up or log in
    - name
    - email
    - password
- 2. user can create a new journal entry that describes their dream
    - they can note down the: 
        - title
        - date
        - category or genre?
            - scary, happy, sad, etc.
        - theme
            - falling, being chased, flying, etc.
        - dream itself
- 3. user can edit / delete their entries


# Notes: 
- User has many dreams
- Dreams belongs to one user 


# 7 Restful Routes
Create Route:
- get "/dreams/new"
    - new form for dream entry
- post "/dreams"
    - post that dream from the new form
Read Routes:
- get "/dreams"
    - getting an index of a resource
- get "/dreams/:id"
    - getting more information of a resource
    - :id is route variable
        - should go after - get "/dreams/new" 
        - want to have dynamic routes below static routes
Update Routes
- get "/dreams/:id/edit" 
    - serve an edit form to update a resource
- patch "/dreams/:id" 
    - used to send information to the controller from a form to update a resource
Destroy Routes
- delete "/dreams/:id"
    - or destroy
    -used to delete a resource


# CRUD
- Create
    - Is for creating a new resource that would be stored in the database
- Read
    - Reading information from database in the browser(list or more information)
- Update
    - Is when we want to update a resource
        - ex: want to correct a typo
        - edit, update
- Destroy
    - deleting a resource

# User Authentication
- allows one user to have it's own resources
- prevents unwanted users to access resources


# Notes
enoch's - 
<%= 'checked' if @todo.completed %>

<%= if option:selected %>

<%='selected' if @dream.horror%>



if selected ? true : false

# welcome user?
    <p class="welcome_user"><%= current_user.username %></p>


# nav with home, dreams, new dream
    <nav>
      <ul>
        <li><a href="/">Home</a></li>
        <li><a href="/dreams">Dreams</a></li>
        <li><a href="/dreams/new">New Dream</a></li>
      </ul>
    </nav>


# flash 
gem 'rack-flash3'

require 'rack-flash' in applicationcontroller under require config...

use Rack::Flash

      <%# flash error: set to an array of errors, iterate through errors, then display as own div %>
        <% if flash[:error] %>
          <% flash[:error].each do |error| %>
          <div>
            <%= error %>
          </div>
        <% end %>

flash.now[:error] = "error message!!!!!"
