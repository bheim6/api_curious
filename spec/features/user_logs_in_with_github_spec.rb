require 'rails_helper'

RSpec.feature "User can log in with Github" do
  before(:each) do
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
      extra: {
        repos_url: "http:://github/Sauron"
      },
      info: {
        uid: "666"
      }
      })
  end

  scenario "User successfully logs in" do
    visit '/'
    expect(page).to have_content('Login with Github')
    click_link 'Login with Github'
    expect(current_path).to eq('/')
    expect(page).to have_content('Hello, Github User') #need to adjust mock auth to pass other params
    expect(page).to have_content('Logout')
  end
end
