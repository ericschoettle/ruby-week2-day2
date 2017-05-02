require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/task")
require("pg")

DB = PG.connect({:dbname => "to_do"})

get("/") do
  @task = Task.all()
  erb(:index)
end

post("/tasks") do
  task = Task.new(params.fetch("description"))
  task.save()
  erb(:success)
end
