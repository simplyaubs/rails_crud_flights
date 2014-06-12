require 'spec_helper'

feature 'CRUD list of flights' do
  scenario 'User can create a list of flights' do
    visit '/'
    expect(page).to have_content 'Welcome'
    click_on 'Add a flight'
    fill_in 'Airline', with: 'Southwest'
    fill_in 'Destination', with: 'Atlanta'
    click_on 'Add flight'
    expect(page).to have_content 'Southwest'
    expect(page).to have_content 'Atlanta'
  end
end