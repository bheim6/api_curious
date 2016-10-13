class GithubUser
  def self.all_info(current_user)
    GithubService.new(current_user).user
  end

  def self.all_repos(current_user)
    GithubService.new(current_user).repos
  end

  def self.starred_repos(current_user)
    GithubService.new(current_user).starred
  end
end
