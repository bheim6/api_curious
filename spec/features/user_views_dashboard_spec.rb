require 'rails_helper'

RSpec.feature "User can see information on dashboard" do
  scenario "User logs in and is redirected to dashboard with info" do
    VCR.use_cassette("omniauth_login") do
      visit '/'
      stub_omniauth

      click_link 'Login with Github'

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content('Hello, Brian Heim') #need to adjust mock auth to pass other params
      expect(page).to have_content('Logout')
      expect(page).to have_content('Followers')
      expect(page).to have_content('Following')
      expect(page).to have_content('Repos')
    end
  end

  scenario "User logs in and is redirected to dashboard with info" do
    VCR.use_cassette("login_and_nav_to_repos") do
      visit '/'
      stub_omniauth

      click_link 'Login with Github'
      click_link 'All Repos'

      expect(current_path).to eq('/dashboard/repos')
      expect(page).to have_content('Repos For bheim6')
    end
  end
end
