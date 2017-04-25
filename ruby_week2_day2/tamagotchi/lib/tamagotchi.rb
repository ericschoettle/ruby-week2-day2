class Tamagotchi
  @@all_Tamagotchi = []

  define_method(:initialize) do |name|
    @name = name
    @food_level = 10
    @rest_level = 10
    @play_level = 10
    @birth = Time.now
    @latest_time = @birth
    @id = @@all_Tamagotchi.length().+(1)
  end

  define_method(:name) do
    @name
  end

  define_method(:food_level) do
    @food_level
  end

  define_method(:rest_level) do
    @rest_level
  end

  define_method(:play_level) do
    @play_level
  end

  define_method(:id) do
    @id
  end

  define_method(:feed) do
    self.time_passes()
    @food_level += 1
  end

  define_method(:rest) do
    self.time_passes()
    @rest_level += 1
  end

  define_method(:play) do
    self.time_passes()
    @play_level += 1
  end

  define_method(:set_food_level) do |food_level|
    @food_level = food_level
  end

  define_method(:set_play_level) do |play_level|
    @play_level = play_level
  end

  define_method(:set_rest_level) do |rest_level|
    @rest_level = rest_level
  end

  define_method(:is_alive?) do
    (@food_level > 0) && (@play_level > 0) && (@rest_level > 0)
  end

  define_method(:age) do
    (Time.now - @birth)/60 # Gives age in minutes
  end

  define_method(:update_time) do
    @latest_time = Time.now
  end

  define_method(:time_passes) do |minutes_passed = ((Time.now - @latest_time)./60)|
    @food_level = @food_level - (minutes_passed * (play_level/rest_level))
    @play_level = @play_level - (minutes_passed)
    @rest_level = @rest_level - (minutes_passed * 0.5)
    @latest_time = Time.now
    self.is_alive?()
  end

  define_singleton_method(:display_all) do
    @@all_Tamagotchi
  end

  define_method(:save) do
    @@all_Tamagotchi.push(self)
  end

  define_singleton_method(:clear) do
    @@all_Tamagotchi = []
  end
  define_singleton_method(:find) do |identification|
    found_tamagotchi = nil
    @@all_Tamagotchi.each() do |test_tamagotchi|
      if test_tamagotchi.id().eql?(identification.to_i())
        found_tamagotchi = test_tamagotchi
      end
    end
    found_tamagotchi
  end
end
