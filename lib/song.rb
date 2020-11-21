class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    named = self.new
    self.all << named
    named
  end

  def self.new_by_name(name_of_song)
    instance = self.new
    instance.name = name_of_song
    instance
  end

  def self.create_by_name(name_of_song)
    newthing = new_by_name(name_of_song)
    newthing.save
    return newthing
  end

  def self.find_by_name(name_of_song)
    array = self.all
    array.find do |song|
      song.name == name_of_song
    end
  end

  def self.find_or_create_by_name(name_of_song)
    found = self.find_by_name(name_of_song)
    if found != nil
      return found
    else
      self.create_by_name(name_of_song)
    end
  end

  def self.alphabetical
    array = self.all
    array.sort_by do |a|
      a.name
    end
  end

  def self.new_from_filename(filename)
    new_thing = self.new
    success = filename.split(" - ")
    new_thing.artist_name = success[0] 
    new_thing.name = success[1].split(".")[0]
    new_thing
  end

  def self.create_from_filename(filename)
    new_thing = self.new
    success = filename.split(" - ")
    new_thing.artist_name = success[0] 
    new_thing.name = success[1].split(".")[0]
    new_thing.save
  end



  def self.destroy_all
    self.all.clear
  end
end




# Song.create_by_name("cheezewhiz")
# Song.create_by_name('Macarena')
# puts Song.alphabetical
song = Song.new_from_filename("Taylor Swift - Blank Space.mp3")
puts song
