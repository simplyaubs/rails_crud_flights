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

  scenario 'User can update a flight' do
    visit '/'
    expect(page).to have_content 'Welcome'
    click_on 'Add a flight'
    fill_in 'Airline', with: 'Southwest'
    fill_in 'Destination', with: 'Atlanta'
    click_on 'Add flight'
    expect(page).to have_content 'Southwest'
    expect(page).to have_content 'Atlanta'
    click_on 'Southwest'
    expect(page).to have_content 'Southwest'
    expect(page).to have_content 'Atlanta'
    click_on 'Edit'
    fill_in 'Airline', with: 'Delta'
    fill_in 'Destination', with: 'Vegas'
    click_on 'Update flight'
    expect(page).to have_content 'Delta'
    expect(page).to have_content 'Vegas'
    expect(page).to_not have_content 'Southwest'
    expect(page).to_not have_content 'Atlanta'
  end

  scenario 'User can delete a flight' do
    visit '/'
    expect(page).to have_content 'Welcome'
    click_on 'Add a flight'
    fill_in 'Airline', with: 'Southwest'
    fill_in 'Destination', with: 'Atlanta'
    click_on 'Add flight'
    expect(page).to have_content 'Southwest'
    expect(page).to have_content 'Atlanta'
    click_on 'Southwest'
    expect(page).to have_content 'Southwest'
    expect(page).to have_content 'Atlanta'
    click_on 'Delete'
    expect(page).to_not have_content 'Southwest'
    expect(page).to_not have_content 'Atlanta'
  end
end