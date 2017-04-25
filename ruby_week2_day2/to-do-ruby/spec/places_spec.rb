require('rspec')
require('places')

describe(Places) do
  before() do
    Places.clear()
  end

  describe('.display_all') do
    it("is empty at first") do
      expect(Places.display_all()).to(eq([]))
    end
    it("lets you display all places you've been") do
      test_place = Places.new("Madrid")
      test_place.save()
      test_place = Places.new("Belize")
      test_place.save()
      expect(Places.display_all()).to(have_content("Madrid"))
    end
  end

  describe("#save") do
    it("adds a place to the array of saved places") do
      test_place = Places.new("Madrid")
      test_place.save()
      expect(Places.display_all()).to(eq([test_place]))
    end
  end

  describe('#name') do
    it "gives the name of a place you've been" do
      test_place = Places.new("Madrid")
      expect(test_place.name()).to(eq("Madrid"))
    end
  end

  describe(".clear") do
    it("empties out all of the saved places") do
      Places.new("wash the lion").save()
      Places.clear()
      expect(Places.display_all()).to(eq([]))
    end
  end
end
