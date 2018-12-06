require_relative '../feature_helper'

feature 'Sign in', :devise do

  let!(:user) { create(:user) }


  scenario 'user cannot sign in if not registered' do
    sign_in(user)
    expect(page).to have_content('Signed in successfully.')
    visit todos_path
    click_on 'New'
    expect(page).to have_content('New Todo')
    fill_in 'Name', with: 'My Todo'
    click_on 'Create Todo'
    expect(page).to have_content('Todo was successfully created.')
  end

end
