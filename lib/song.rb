class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = "", artist_name = "")
    @name = name
    @artist_name = artist_name
    save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new
  end

  def self.new_by_name(name)
    new(name)
  end

  def self.create_by_name(name)
    new(name)
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    find_a_song = find_by_name(name)
    find_a_song ? find_a_song : create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file_name)
    file = file_name.split(" - ")
    new(file[1].split(".")[0], file[0])
  end

  def self.create_from_filename(file_name)
    new_from_filename(file_name)
  end

  def self.destroy_all
    @@all = []
  end 
end
