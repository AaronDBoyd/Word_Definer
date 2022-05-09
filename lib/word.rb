class Word
  attr_reader :id, :word

  @@words = {}
  @@total_rows = 0

  def intitialize(word, id)
    @word = word
    @id = id || @@total_rows += 1
  end

  def self.all
    @@words.values
  end
end
