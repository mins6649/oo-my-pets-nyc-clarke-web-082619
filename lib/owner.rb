class Owner

  @@all = []

  attr_reader :name, :species 

  def initialize(name)
    @name = name
    @species = "human"

    @@all << self
  end

  def say_species
    @species == self
    return "I am a human."
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(new_cat)
    Cat.new(new_cat, self)
  end

  def buy_dog(new_dog)
    Dog.new(new_dog, self)
  end

  def walk_dogs
    self.dogs.map do |dog|
      dog.mood = "happy"
    end
    # Dog.all.select do |dog|
    #   dog.owner == self
    # end.map{|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.map {|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.cats.map do |cat| 
      cat.mood = "nervous"
      cat.owner = nil
    end
    self.dogs.map do |dog| 
      dog.mood = "nervous"
      dog.owner = nil
    end
  end

  def list_pets
    return "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end
    


  def self.all
    @@all
  end

end