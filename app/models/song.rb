
class Song < ActiveRecord::Base
    # add associations here
    belongs_to :artist
    belongs_to :genre
    has_many :notes

    # validates :notes, presence :true

    # setter method = artist_name will be set to (arg of name)
    # song.artist.name = find_or_create_by (arg of name) 
    def artist_name=(name)
        self.artist = Artist.find_or_create_by(name: name)
    end
    
    # reader - does self(Song) have an Artist ? If not set self.artist.name to nil.
    def artist_name
        self.artist ? self.artist.name : nil
    end

    def note_contents=(contents)
        contents.each do |content|
            if content.strip != ""
                self.notes.build(content: content)
            end
        end
    end

    def note_contents
        self.notes.map(&:content)
    end
    
    def genre_name=(name)
        self.genre = Genre.find_or_create_by(name: name)
    end

    def genre_name
        self.genre ? self.genre.name : nil
    end


    # setter method for note_content
    # def note_contents(contents)
    #     contents.each do |content|
    #         note = Note.create(content: content, song_id: self.id)
    #     end
    # end

    # def note_contents
    # end   

end
