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
end
