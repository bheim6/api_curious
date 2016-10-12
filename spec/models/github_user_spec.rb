require 'rails_helper'

describe "Github User" do
  it "returns information about the user" do
    VCR.use_cassette("github_user.all_info") do
      user = User.create(token: ENV['PERSONAL_TOKEN'])
      user_info = GithubUser.all_info(user)

      expect(user_info[:name]).to eq("Brian Heim")
      expect(user_info[:login]).to eq("bheim6")
    end
  end
end
