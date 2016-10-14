class Repo
  def initialize(raw_repo)
    @name = raw_repo["name"]
    @url = raw_repo["html_url"]
  end

  def self.all_repos(current_user)
    GithubService.new(current_user).repos.map do |raw_repo|
      Repo.new(raw_repo)
    end
  end

end
