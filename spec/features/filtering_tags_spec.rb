feature 'filtering by tag' do
  scenario 'only links tagged with a given term are displayed' do
    Link.create(url: 'http://www.ivan.com', title: 'Ivan', tags: [Tag.first_or_create(name: 'people')])
    Link.create(url: 'http://www.bubbles.com', title: 'Bubbles', tags: [Tag.first_or_create(name: 'bubbles')])
    visit '/tags/bubbles'
    expect(page).not_to have_content('Ivan')
    expect(page).to have_content('Bubbles')
  end
end
