feature 'Updating a bookmark' do
  scenario 'A user can update a bookmark' do
    bookmark = Bookmark.create(url: 'http://makersacademy.com', title: 'Makers Academy')

    visit('/bookmarks')
    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in('url', with: "http://www.snakersacademy.com")
    fill_in('title', with: "Snakers Academy")
    click_button('Submit')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Makers Academy', href: 'http://makersacademy.com')
    expect(page).to have_link('Snakers Academy', href: 'http://www.snakersacademy.com')
  end
end