feature 'filtering by tag' do
  scenario 'only links tagged with a given term are displayed' do
    visit '/links/new'
    fill_in('url', with: 'www.facebook.com')
    fill_in('title', with: 'Facebook')
    fill_in('name', with: 'Social')
    click_button('Submit')
    visit '/links/new'
    fill_in('url', with: 'www.bubbles.com')
    fill_in('title', with: 'Bubbles')
    fill_in('name', with: 'bubbles')
    click_button('Submit')
    visit '/tags/bubbles'
    expect(page).not_to have_content('Facebook')
    expect(page).to have_content('Bubbles')
  end
end
