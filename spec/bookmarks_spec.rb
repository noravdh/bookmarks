require 'bookmarks'

require 'database_helpers'

describe Bookmarks do
  it "can return a list of bookmarks" do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    bookmark = Bookmarks.create(url: "http://www.makersacademy.com", title: "Makers Academy")
    Bookmarks.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
    Bookmarks.create(url: "http://www.google.com", title: "Google")

    bookmarks = Bookmarks.all

    expect(bookmarks.length).to eq 3
    expect(bookmarks.first).to be_a Bookmarks
    expect(bookmarks.first.id).to eq bookmark.id
    expect(bookmarks.first.title).to eq 'Makers Academy'
    expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
  end

  it 'creates a new bookmark' do
    bookmark = Bookmarks.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
    persisted_data = persisted_data(id: bookmark.id)

    expect(bookmark).to be_a Bookmarks
    expect(bookmark.id).to eq persisted_data.first['id']
    expect(bookmark.title).to eq 'Test Bookmark'
    expect(bookmark.url).to eq 'http://www.testbookmark.com'
  end

  it 'deletes a bookmark' do
    bookmark = Bookmarks.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')

    Bookmarks.delete(id: bookmark.id)
    
    expect(Bookmarks.all.length).to eq 0
  end

  it 'updates a bookmark' do
    bookmark = Bookmarks.create(url: "http://www.makersacademy.com", title: "Makers Academy")
    updated_bookmark = Bookmarks.update(id: bookmark.id, url: 'http://www.snakersacademy.com', title: 'Snakers Academy')
  
    expect(updated_bookmark).to be_a Bookmarks
    expect(updated_bookmark.id).to eq bookmark.id
    expect(updated_bookmark.title).to eq 'Snakers Academy'
    expect(updated_bookmark.url).to eq 'http://www.snakersacademy.com'
  end

  it 'returns the requested Bookmark object' do
    bookmark = Bookmarks.create(url: "http://www.makersacademy.com", title: "Makers Academy")

    result = Bookmarks.find(id: bookmark.id)

    expect(result).to be_a Bookmarks
    expect(result.id).to eq bookmark.id
    expect(result.title).to eq 'Makers Academy'
    expect(result.url).to eq 'http://www.makersacademy.com'
  end
end
