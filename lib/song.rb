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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by do |song|
     song.name
    end
  end

  def self.new_from_filename(filename)
    split = filename.split(/[-.]/)
    song = self.new
    song.name = split[1].strip
    song.artist_name = split[0].strip
    song
  end

  def self.create_from_filename(filename)
    split = filename.split(/[-.]/)
    song = self.create
    song.name = split[1].strip
    song.artist_name = split[0].strip
    song
  end

  def self.destroy_all
    @@all = []
  end



end
