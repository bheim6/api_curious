class DashboardController < ApplicationController
  def index
    @user_info = GithubUser.all_info(current_user)
  end

  def repos
    @user_repos = GithubUser.all_repos(current_user)  
  end

  def starred
    @starred_repos = GithubUser.starred_repos(current_user)
  end
end
