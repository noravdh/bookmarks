require 'bookmarks'

describe Bookmarks do
  it "can return a list of bookmarks" do
    bookmarks = Bookmarks.all

    expect(bookmarks).to eq([
      "https://www.makersacademy.com",
      "https://www.destroyallsoftware.com",
      "https://www.google.com"
    ])
  end
end