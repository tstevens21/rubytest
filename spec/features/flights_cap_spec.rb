

require 'rails_helper'

feature 'Get Flights' do
  background do
    visit ('http://localhost:3000/flights/new')
    fill_in :Destination, with: 'Orlando'
    click_button 'Create Flight'
  end

  scenario  'Get Flights' do
        visit ('http://localhost:3000/flights')
        expect(page).to have_content 'Orlando'
  end

  scenario 'User creates new flight' do
    visit ('http://localhost:3000/flights/new')
    fill_in :Destination, with: 'Dallas'
    click_button 'Create Flight'
    expect(page).to have_content 'Dallas'
    visit ('http://localhost:3000/flights')
    expect(page).to have_content 'Orlando'
  end

  scenario 'User updates Orlando Flight to Portland' do
      visit ('http://localhost:3000/flights/1/edit')
      fill_in :Destination, with: 'Portland'
      click_button 'Update Flight'
      visit ('http://localhost:3000/flights')
      expect(page).to have_content 'Portland'  
  end

  scenario 'User deletes Orlando flight' do
      visit ('http://localhost:3000/flights')
      find(:xpath, "(//a[@href='/flights/1'])[2]").click
      visit ('http://localhost:3000/flights')
      expect(page).to_not have_content('Orlando')      
  end

  end

