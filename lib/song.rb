class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = nil, artist = nil)
    @name = name
    @artist_name = artist
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    # song = Song.new()
    # self.all << song
    # return song
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new(name)
    return song
  end

  def self.create_by_name(new_name)
    song = self.create
    song.name =  new_name
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else 
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|x| x.name}
  end

  def self.new_from_filename(file_name)
    array = file_name.split(/[-,.]/).map {|x| x.strip}
    song = Song.new(array[1], array[0])
  end

  def self.create_from_filename(file_name)
    array = file_name.split(/[-,.]/).map {|x| x.strip}
    song = Song.new(array[1], array[0])
    song.save
  end

  def self.destroy_all
    self.all.clear
  end
    
    

end
