feature "adding a tag to link" do
  scenario "adding one tag to link" do
    visit ('/links/new')
    fill_in('url', :with => 'www.facebook.com')
    fill_in('title', :with => 'Facebook')
    fill_in('tags', :with => 'Social')
    click_button('Submit')
    link = Link.first
    expect(link.tags.map(&:tags)).to include('Social')
  end
end
