class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end 

  def artist_name
    self.artist ? self.artist.name : nil 
  end 

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end 

  def genre_name
    self.genre ? self.genre.name : nil 
  end 

  def note_contents=(notes)
    notes.each do |content|
      if content.strip != ''
        self.notes.build(content: content)
      end
    end
  end

  def note_contents
    self.notes.map(&:content)
  end
end


# setter and getter methods to use to call the song's artist name instead of writing a method in the controller everytime tha
# you want to call the name in the views which wouldnt be dry 
# called a "virtual" method 
