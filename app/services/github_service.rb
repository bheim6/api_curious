class GithubService
  def initialize(current_user)
    @current_user = current_user
  end

  def conn
    Faraday.new(:url => "https://api.github.com") do |f|
      f.adapter  Faraday.default_adapter
      f.params[:access_token] = @current_user.token
    end
  end

  def user
    response = conn.get "/user"
    JSON.parse(response.body, symbolize_names: true)
  end

  def repos
    response = conn.get "/user/repos"
    JSON.parse(response.body, symbolize_names: true)
  end

  def starred
    response = conn.get "/user/starred"
    JSON.parse(response.body, symbolize_names: true)
  end

  def recent
    response = conn.get "/users/#{@current_user.nickname}/events"
    JSON.parse(response.body, symbolize_names: true)
  end
end
