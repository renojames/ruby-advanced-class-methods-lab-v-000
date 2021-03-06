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
    song = self.new
    self.all << song
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
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.each do |song|
      if song.name == name
        return song
      end
    end
    nil
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
      if !song
        song = self.create_by_name(name)
      end
    return song
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.destroy_all
    @@all = []
  end

  def self.new_from_filename(filename)
    filename.slice! ".mp3"
    filename = filename.split(' - ')
    song = self.new
    song.name = filename[1]
    song.artist_name = filename[0]
    return song
  end

  def self.create_from_filename(filename)
    filename.slice! ".mp3"
    filename = filename.split(' - ')
    song = self.new
    song.name = filename[1]
    song.artist_name = filename[0]
    self.all << song
    return song
  end

end
