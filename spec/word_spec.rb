require('rspec')
require('word')
require('definition')

describe('#Word') do 

  before(:each) do 
    Word.clear()
  end

  describe('.all') do 
    it('returns an empty array when there are no words') do 
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do 
    it('saves a word') do 
      apple = Word.new('Apple', nil)
      apple.save()
      banana = Word.new('Banana', nil)
      banana.save()
      expect(Word.all).to(eq([apple, banana]))
    end
  end

  describe('#==') do
    it("is the same word if it has the same attributes as another word") do
      word = Word.new('Blue', nil)
      word2 = Word.new('Blue', nil)
      expect(word).to(eq(word2))
    end
  end

  describe('.clear') do
    it("clears all words") do
      word = Word.new("Apple", nil)
      word.save()
      word2 = Word.new("Blue", nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds a word by id") do
      word = Word.new("Apple", nil)
      word.save()
      word2 = Word.new("Blue", nil)
      word2.save()
      expect(Word.find(word.id)).to(eq(word))
    end
  end

  describe('#update') do
    it("updates a word by id") do
      word = Word.new("Apple", nil)
      word.save()
      word.update("Blue")
      expect(word.word).to(eq("Blue"))
    end
  end
end