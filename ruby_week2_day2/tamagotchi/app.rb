require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/tamagotchi")
require("pry")

get("/") do
  @all_tamagotchi = Tamagotchi.display_all()
  erb(:index)
end

post("/tamagotchi") do
  tamagotchi = Tamagotchi.new(params.fetch("name"))
  tamagotchi.save()
  erb(:success)
end

get('/tamagotchis/:id') do
  # @tamagotchi = Tamagotchi.find(params:[id])
  @tamagotchi = Tamagotchi.find(params.fetch("id"))
  erb(:play)
end

get ('/play/:id') do
  @tamagotchi = Tamagotchi.find(params.fetch("id"))
  erb(:play)
end

post("/play/:id") do
  @tamagotchi = Tamagotchi.find(params.fetch("id"))
  if params[:commit] == 'feed'
    @tamagotchi.feed()
  elsif params[:commit] == 'play'
    @tamagotchi.play()
  elsif params[:commit] == 'rest'
    @tamagotchi.rest()
  end
  erb(:play)
end
