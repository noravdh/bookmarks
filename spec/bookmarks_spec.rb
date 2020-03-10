require 'bookmarks'

describe Bookmarks do
  it "can return a list of bookmarks" do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")

    bookmarks = Bookmarks.all

    expect(bookmarks).to include "http://www.makersacademy.com"
    expect(bookmarks).to include "http://www.destroyallsoftware.com"
    expect(bookmarks).to include "http://www.google.com"
  end

  it 'creates a new bookmark' do
    Bookmarks.create(url: 'http://www.testbookmark.com')

    expect(Bookmarks.all).to include 'http://www.testbookmark.com'
  end
end
