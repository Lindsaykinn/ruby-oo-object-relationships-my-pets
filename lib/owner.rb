class Owner
  attr_reader :name, :species, :say_species

    @@all = []
   

  def initialize(name)
    @name = name
    @species = "human"
    @say_species = "I am a human."
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end
  
  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs 
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    @@all << Cat.new(name, self)
    # Cat.all.each do |name|
    # end
  end

  def buy_dog(name)
    @@all << Dog.new(name, self)
  end

  def walk_dogs
    #this calls on #dogs to return a specific dog that belongs to the owner
    self.dogs.select {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.select {|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.dogs.select {|dog| dog.mood = "nervous"} 
    self.cats.select {|cat| cat.mood = "nervous"} 
    self.dogs.select {|dog| dog.owner = nil}
    self.cats.select {|cat| cat.owner = nil}    
  end

  def list_pets
    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
    
  end

end