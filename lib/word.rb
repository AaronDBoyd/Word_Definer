class Word
  attr_reader :id, :word

  @@words = {}
  @@total_rows = 0

  def initialize(word, id)
    @word = word
    @id = id || @@total_rows += 1
  end

  def self.all
    @@words.values
  end

  def save 
    @@words[self.id] = Word.new(self.word, self.id)
  end

  def ==(word_to_compare)
    self.word() == word_to_compare.word()
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@words[id]
  end

  def update(word)
    @word = word
  end

  def delete
    @@words.delete(self.id)
  end
end
