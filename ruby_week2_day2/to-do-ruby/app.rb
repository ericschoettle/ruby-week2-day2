require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/Tamagotchi")

get("/") do
  @tamagotchi = Tamagotchi.display_all()
  erb(:index)
end

post("/tasks") do
  place = Tamagotchi.new(params.fetch("description"))
  place.save()
  erb(:success)
end
