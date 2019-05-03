
require 'pry'

class Owner

  @@all = []
  @pets = {}
  attr_accessor :name, :pets
  attr_reader :species

  def initialize(name)
    @pets = {fishes: [], cats: [], dogs: []}
    @species = "human"
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    fish_object = Fish.new(name)
    pets[:fishes] << fish_object
  end

  def buy_cat(name)
    cat_object = Cat.new(name)
    pets[:cats] << cat_object
  end

  def buy_dog(name)
    dog_object = Dog.new(name)
    pets[:dogs] << dog_object
    #binding.pry
  end

  def walk_dogs
     @pets[:dogs][0].mood = "happy"
  end

  def play_with_cats
    @pets[:cats][0].mood = "happy"
  end

  def feed_fish
    @pets[:fishes][0].mood = "happy"
  end

  def sell_pets
    @pets.each do |type, value|
      value.each do |dog_object|
        dog_object.mood = "nervous"
      end
    end
    @pets = {}
  end

  def list_pets
    fish_count = @pets[:fishes].count
    dogs_count = @pets[:dogs].count
    cats_count = @pets[:cats].count
    "I have #{fish_count} fish, #{dogs_count} dog(s), and #{cats_count} cat(s)."
  end




end
