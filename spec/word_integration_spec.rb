require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('#Word CRUD functionality', {:type => :feature}) do
  it('CREATES a word and then goes to the words page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'House')
    click_on('Go!')
    expect(page).to have_content('House')
  end

  it('READS a word and directs to its page by clicking on it') do 
    house = Word.new("House123", nil)
    house.save()
    visit('/words')
    click_on("House123")
    expect(page).to have_content('House123')
  end

  it('UPDATES a word') do 
    pencil = Word.new("Pencil", nil)
    pencil.save()
    visit("/words/#{pencil.id}/edit")
    fill_in('name', :with => "Marker")
    click_on('Update')
    expect(page).to have_content("Marker")
  end

  it('DELETES a word') do
    Word.clear
    pencil = Word.new("Pencil", nil)
    pencil.save()
    marker = Word.new("Marker", nil)
    marker.save()
    visit("/words/#{marker.id}/edit")
    click_on("Delete")
    expect(page).to have_no_content('Marker')
  end
end

describe('#Definition CRUD functionality', {:type => :feature}) do 
  it('CREATES a definition for a word') do
    pencil = Word.new("Pencil", nil)
    pencil.save
    visit("/words/#{pencil.id}")
    fill_in('definition_name', :with => 'writing utencil')
    click_on('Add Definition')
    expect(page).to have_content('writing utencil')
  end

  it('READS a definition and directs to its page by clicking on it') do
    pencil = Word.new("Pencil", nil)
    pencil.save
    deff = Definition.new('writing utencil', pencil.id, nil)
    deff.save
    visit("/words/#{pencil.id}")
    click_on('writing utencil')
    expect(page).to have_content('writing utencil')
  end

  it('UPDATES a definition') do
    dragon = Word.new('Dragon', nil)
    dragon.save
    deff = Definition.new('big lizard', dragon.id, nil)
    deff.save
    visit("/words/#{dragon.id}/definitions/#{deff.id}")
    fill_in('name', :with => 'mythical creature')
    click_on('Update definition')
    expect(page).to have_content('mythical creature')

  end

  it('DELETES a definition') do
    dragon = Word.new("Dragon", nil)
    dragon.save
    deff= Definition.new("big lizard", dragon.id, nil)
    deff.save()
    visit("/words/#{dragon.id}/definitions/#{deff.id}")
    click_on('Delete definition')
    expect(page).to have_no_content('big lizard')
  end
end


