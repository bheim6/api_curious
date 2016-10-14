require 'rails_helper'

describe "Github User" do
  it "returns information about the user" do
    VCR.use_cassette("github_user.all_info") do
      user = User.create(token: ENV['PERSONAL_TOKEN'])
      user_info = GithubUser.all_info(user)

      expect(user_info.name).to eq("Brian Heim")
      expect(user_info.login).to eq("bheim6")
    end
  end

  it "returns all repos for the user" do
    VCR.use_cassette("github_user.all_repos") do
      user = User.create(token: ENV['PERSONAL_TOKEN'])
      user_repos = GithubUser.all_repos(user)

      expect(user_repos.count).to eq(30)
    end
  end

  it "returns all starred repos for the user" do
    VCR.use_cassette("github_user.starred_repos") do
      user = User.create(token: ENV['PERSONAL_TOKEN'])
      starred = GithubUser.starred_repos(user)

      expect(starred.count).to eq(4)
    end
  end

  it "returns recent_activity for the user" do
    VCR.use_cassette("github_user.recent_activity") do
      user = User.create(token: ENV['PERSONAL_TOKEN'], nickname: 'bheim6')
      user_activity = GithubUser.recent_activity(user)

      expect(user_activity.count).to eq(30)
    end
  end
end
