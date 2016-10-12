class GithubUser
  def self.all_info(current_user)
    GithubService.new(current_user).user
  end
end
