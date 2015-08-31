class PagesController < ApplicationController
  def queries
  	@projects = Project.all
  	@tasks = Task.all
  	@users = User.all

  	connection = ActiveRecord::Base.connection

  	@query2 = connection.execute(
  		"SELECT projects.title, COUNT(tasks.project_id) FROM projects 
  		LEFT JOIN tasks ON tasks.project_id = projects.id 
  		GROUP BY projects.id
  		ORDER BY COUNT(tasks.project_id) DESC")

  	@query3 = connection.execute(
  		"SELECT projects.title, COUNT(tasks.project_id) FROM projects 
  		LEFT JOIN tasks ON tasks.project_id = projects.id 
  		GROUP BY projects.id
  		ORDER BY projects.title")

  	@query4 = connection.execute(
  		"SELECT tasks.content, projects.title FROM tasks
  		LEFT JOIN projects ON tasks.project_id = projects.id 
  		WHERE projects.title LIKE 'N%'")

  	@query5 = connection.execute("
  		SELECT projects.title, COUNT(tasks.project_id) FROM projects
  		LEFT JOIN tasks ON tasks.project_id = projects.id
  		WHERE projects.title LIKE '%a%'
  		GROUP BY projects.id")

  	@query6 = connection.execute("
  		SELECT content, COUNT(*) FROM tasks
  		GROUP BY content
  		HAVING COUNT(*) > 1
  		ORDER BY content")

    @query8 = connection.execute("
      SELECT projects.title, COUNT(tasks.project_id) FROM projects
      LEFT JOIN tasks ON tasks.project_id = projects.id
      WHERE tasks.completed_at IS NOT NULL
      GROUP BY projects.id      
      HAVING COUNT(tasks.project_id) > 10
      ORDER BY project_id")
  end
end
