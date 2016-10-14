class GithubUser
  def initialize(attrs)
    @attrs = attrs
  end

  def followers
    attrs[:followers]
  end

  def following
    attrs[:following]
  end

  def avatar
    attrs[:avatar_url]
  end

  def name
    attrs[:name]
  end

  def login
    attrs[:login]
  end

  def self.all_info(current_user)
    raw_user = GithubService.new(current_user).user
    GithubUser.new(raw_user)
  end

  def self.all_repos(current_user)
    GithubService.new(current_user).repos.map do |raw_repo|
      Repo.new(raw_repo)
    end
  end

  def self.starred_repos(current_user)
    GithubService.new(current_user).starred
  end

  def self.recent_activity(current_user)
    GithubService.new(current_user).recent
  end

  private
  attr_reader :attrs
end
