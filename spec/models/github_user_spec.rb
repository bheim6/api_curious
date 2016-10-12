require 'rails_helper'

describe "Github User" do
  before(:each) do
    OmniAuth.config.test_mode = true

    # OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    #   provider: 'github',
    #     info: {
    #       name: "Sauron",
    #       nickname: "Morgoth"
    #     },
    #     credentials: {
    #       token: "theonering"
    #     }
    #   })
  end

  it "returns information about the user" do
    user = User.create(token: ENV['PERSONAL_TOKEN'])

    user_info = GithubUser.all_info(user)

    expect(user_info[:name]).to eq("Brian Heim")
    expect(user_info[:login]).to eq("bheim6")
  end
end
