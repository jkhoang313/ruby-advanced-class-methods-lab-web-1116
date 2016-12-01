require 'pry'

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
    self.all << Song.new
    self.all.last
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) ? find_by_name(song_name) : create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name.downcase}
  end

  def self.new_from_filename(file_name)
    file = file_name.split(" - ")
    new_song = new_by_name(file[1].chomp(".mp3"))
    new_song.artist_name = file[0]
    new_song
  end

  def self.create_from_filename(file_name)
    file = file_name.split(" - ")
    new_song = create_by_name(file[1].chomp(".mp3"))
    new_song.artist_name = file[0]
    new_song
  end

  def self.destroy_all
    self.all.clear
  end
end
