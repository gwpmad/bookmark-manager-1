feature 'User signs up' do
  before(:each) do
    visit ('/')
    fill_in('username', with: 'George')
    fill_in('email', with: 'george@test.com')
    fill_in('password', with: '12345')
  end

  scenario 'displays a welcome message after user signs up' do
    click_button('Sign up')
    expect(page).to have_content('Welcome George')
  end

  scenario 'User count increase by one' do
    user_count_before = User.count
    click_button('Sign up')
    user_count_after = User.count
    expect(user_count_after).to eq user_count_before + 1
  end

  scenario 'Email address is correctly added to database' do
    click_button('Sign up')
    user = User.first(username: 'George')
    expect(user.email).to eq 'george@test.com'
  end
end
