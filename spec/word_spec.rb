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
      expect(word.name).to(eq("Blue"))
    end
  end

  describe('#delete') do
    it("deletes a word by id") do
      apple = Word.new("Apple", nil)
      apple.save()
      blue = Word.new("Blue", nil)
      blue.save()
      apple.delete()
      expect(Word.all).to(eq([blue]))
    end
  end

  describe('#definitions') do
    it("returns a word's definitions") do
      Definition.clear
      house = Word.new("House", nil)
      house.save()
      definition1 = Definition.new("A structure to live in.", house.id, nil)
      definition1.save()
      definition2 = Definition.new("A place to keep your stuff.", house.id, nil)
      definition2.save()
      expect(house.definitions).to(eq([definition1, definition2]))
    end
  end
end