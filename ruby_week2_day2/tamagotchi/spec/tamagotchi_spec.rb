require('rspec')
require('Tamagotchi')

describe(Tamagotchi) do
  before() do
    Tamagotchi.clear()
  end
  describe("#initialize") do
    it("sets the name and life levels of a new Tamagotchi") do
      my_pet = Tamagotchi.new("lil dragon")
      expect(my_pet.name()).to(eq("lil dragon"))
      expect(my_pet.food_level()).to(eq(10))
      expect(my_pet.rest_level()).to(eq(10))
      expect(my_pet.play_level()).to(eq(10))
    end
  end

  describe("#is_alive") do
    it("is alive if the food level is above 0") do
      my_pet = Tamagotchi.new("lil dragon")
      expect(my_pet.is_alive?()).to(eq(true))
    end

    it("is dead if the food level is 0") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.set_food_level(0)
      expect(my_pet.is_alive?()).to(eq(false))
    end

    it("is dead if the play level is 0") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.set_play_level(0)
      expect(my_pet.is_alive?()).to(eq(false))
    end

    it("is dead if the rest level is 0") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.set_rest_level(0)
      expect(my_pet.is_alive?()).to(eq(false))
    end
  end

  describe("#set_food_level") do
    it("changes the food level") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.set_food_level(3)
      expect(my_pet.food_level()).to(eq(3))
    end
  end

  describe("#set_rest_level") do
    it("changes the rest level") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.set_rest_level(3)
      expect(my_pet.rest_level()).to(eq(3))
    end
  end

  describe("#set_play_level") do
    it("changes the play level") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.set_play_level(3)
      expect(my_pet.play_level()).to(eq(3))
    end
  end

  describe("#time_passes") do
    it("decreases the amount of food the Tamagotchi has left") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.time_passes(1)  #decide what trigger you will use to make time pass
      expect(my_pet.food_level()).to(eq(9))
    end
    it("decreases the amount of rest the Tamagotchi has left by 0.5") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.time_passes(1)  #decide what trigger you will use to make time pass
      expect(my_pet.rest_level()).to(eq(9.5))
    end
    it("decreases the amount of play the Tamagotchi has left by 1") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.time_passes(1)  #decide what trigger you will use to make time pass
      expect(my_pet.play_level()).to(eq(9))
    end
  end

  describe(".find") do
    it("returns a tamagotchi by its id number") do
      test_tamagotchi = Tamagotchi.new("lil dragon")
      test_tamagotchi.save()
      test_tamagotchi2 = Tamagotchi.new("big dragon")
      test_tamagotchi2.save()
      expect(Tamagotchi.find(test_tamagotchi.id())).to(eq(test_tamagotchi))
    end
  end

  describe("#id") do
    it("returns the id of the tamagotchi") do
      test_tamagotchi = Tamagotchi.new("lil dragon")
      test_tamagotchi.save()
      expect(test_tamagotchi.id()).to(eq(1))
    end
  end
end
