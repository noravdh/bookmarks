require 'bookmarks'

require 'database_helpers'

describe Bookmark do
  it "can return a list of bookmarks" do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
    Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
    Bookmark.create(url: "http://www.google.com", title: "Google")

    bookmarks = Bookmark.all

    expect(bookmarks.length).to eq 3
    expect(bookmarks.first).to be_a Bookmark
    expect(bookmarks.first.id).to eq bookmark.id
    expect(bookmarks.first.title).to eq 'Makers Academy'
    expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
  end

  it 'creates a new bookmark' do
    bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
    persisted_data = persisted_data(id: bookmark.id)

    expect(bookmark).to be_a Bookmark
    expect(bookmark.id).to eq persisted_data.first['id']
    expect(bookmark.title).to eq 'Test Bookmark'
    expect(bookmark.url).to eq 'http://www.testbookmark.com'
  end

  it 'deletes a bookmark' do
    bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')

    Bookmark.delete(id: bookmark.id)
    
    expect(Bookmark.all.length).to eq 0
  end

  it 'updates a bookmark' do
    bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
    updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.snakersacademy.com', title: 'Snakers Academy')
  
    expect(updated_bookmark).to be_a Bookmark
    expect(updated_bookmark.id).to eq bookmark.id
    expect(updated_bookmark.title).to eq 'Snakers Academy'
    expect(updated_bookmark.url).to eq 'http://www.snakersacademy.com'
  end

  it 'returns the requested Bookmark object' do
    bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")

    result = Bookmark.find(id: bookmark.id)

    expect(result).to be_a Bookmark
    expect(result.id).to eq bookmark.id
    expect(result.title).to eq 'Makers Academy'
    expect(result.url).to eq 'http://www.makersacademy.com'
  end
end
