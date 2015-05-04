

require 'rails_helper'

feature 'Get Flights' do
  background do
    visit ('http://localhost:3000/flights/new')
    fill_in :Destination, with: 'Orlando'
    click_button 'Create Flight'
  end

  scenario 'User creates new flight' do
    visit ('http://localhost:3000/flights/new')
    fill_in :Destination, with: 'Dallas'
    click_button 'Create Flight'
    expect(page).to have_content 'Dallas'
    visit ('http://localhost:3000/flights')
    expect(page).to have_content 'Orlando'
  end

    
  scenario  'Get Flights' do

       # session = Capybara::Session.new(:webkit)
        visit ('http://localhost:3000/flights')
        #save_and_open_page
        ##fill_in :username, with: 'johndoe'
        ##click_button 'Sign in'
        ##puts page.body.to_s
        expect(page).to have_content 'Orlando'
  end

  end

