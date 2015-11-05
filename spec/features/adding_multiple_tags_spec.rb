feature 'adding multiple tags' do
  scenario 'all tags are displayed for each link' do
    Link.create(url: 'http://www.ivan.com', title: 'Ivan', tags: [Tag.first_or_create(name: 'people'),Tag.first_or_create(name: 'bedford')])
    visit ('/links/index')
    expect(page).to have_content('people')
    expect(page).to have_content('bedford')
  end
end
