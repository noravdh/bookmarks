require 'bookmarks'

describe Bookmarks do
  it "can return a list of bookmarks" do

    Bookmarks.create(url: "http://www.makersacademy.com")
    Bookmarks.create(url: "http://www.destroyallsoftware.com")
    Bookmarks.create(url: "http://www.google.com")

    bookmarks = Bookmarks.all

    expect(bookmarks).to include "http://www.makersacademy.com"
    expect(bookmarks).to include "http://www.destroyallsoftware.com"
    expect(bookmarks).to include "http://www.google.com"
  end

  it 'creates a new bookmark' do
    Bookmarks.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark').first
    bookmarks = Bookmarks.all
    expect(bookmarks['url']).to eq 'http://www.testbookmark.com'
    expect(bookmarks['title']).to eq 'Test Bookmark'
  end
end
